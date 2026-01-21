import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Endpoint for fetching random images.
const endpoint = 'https://november7-730026606190.europe-west1.run.app/image';

/// Repository responsible for fetching images from the remote endpoint.
class ImageFetchingRepo {
  /// Creates a new instance of [ImageFetchingRepo].
  ImageFetchingRepo({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  /// Fetches a random image based on the provided [configuration].
  Future<ImageProvider> fetchRandomImage({
    ImageConfiguration configuration = ImageConfiguration.empty,
  }) async {
    final uri = Uri.parse(
      endpoint,
    );
    final res = await _client.get(uri);

    if (res.statusCode != 200) {
      throw Exception('Failed to fetch image (status ${res.statusCode})');
    }

    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final url = body['url'];
    if (url is! String || url.isEmpty) {
      throw Exception('Invalid response: missing url');
    }

    final dpr = configuration.devicePixelRatio ?? 1.0;
    final width = configuration.size?.width;

    final provider = ResizeImage(
      NetworkImage(url),
      width: (width != null) ? (width * dpr).round() : null,
    );

    try {
      await _preResolve(provider, configuration);
    } catch (e) {
      throw Exception('Failed to pre-resolve image: $e');
    }

    return provider;
  }

  /// Pre-resolves the given [provider] with the specified [configuration].
  /// Throws an exception if the image fails to load.
  Future<void> _preResolve(
    ImageProvider provider,
    ImageConfiguration configuration,
  ) {
    final completer = Completer<void>();
    final stream = provider.resolve(configuration);
    // I need to refer the listener later to remove it
    late final ImageStreamListener listener;

    listener = ImageStreamListener(
      (image, _) {
        stream.removeListener(listener);
        if (!completer.isCompleted) completer.complete();
      },
      onError: (error, stack) {
        stream.removeListener(listener);
        if (!completer.isCompleted) completer.completeError(error, stack);
      },
    );

    stream.addListener(listener);
    return completer.future;
  }

  /// Disposes the HTTP client.
  void dispose() {
    _client.close();
  }
}
