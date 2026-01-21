import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// A background widget that adapts its gradient colors
/// based on the dominant colors of the provided [image].
class AdaptiveGradientBackground extends StatefulWidget {
  /// Creates a new instance of [AdaptiveGradientBackground].
  const AdaptiveGradientBackground({
    required this.image,
    required this.configuration,
    required this.reducedMotion,
    super.key,
  });

  /// The image used to extract dominant colors for the gradient.
  final ImageProvider? image;

  /// Configuration for resolving the image.
  final ImageConfiguration configuration;

  /// Whether to reduce motion for accessibility.
  final bool reducedMotion;

  @override
  State<AdaptiveGradientBackground> createState() =>
      _AdaptiveGradientBackgroundState();
}

class _AdaptiveGradientBackgroundState
    extends State<AdaptiveGradientBackground> {
  Color _c1 = Colors.black;
  Color _c2 = Colors.black;
  ImageProvider? _lastImage;
  ImageStream? _stream;
  ImageStreamListener? _listener;

  @override
  void initState() {
    super.initState();
    _maybeUpdateColors();
  }

  @override
  void didUpdateWidget(covariant AdaptiveGradientBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
      _maybeUpdateColors();
    }
  }

  @override
  void dispose() {
    _stream?.removeListener(_listener!);
    super.dispose();
  }

  Future<void> _maybeUpdateColors() async {
    if (widget.image == null || widget.image == _lastImage) return;
    _lastImage = widget.image;

    final stream = widget.image!.resolve(widget.configuration);
    _stream?.removeListener(_listener ?? ImageStreamListener((_, _) {}));
    _stream = stream;

    final completer = Completer<ImageInfo>();
    _listener = ImageStreamListener(
      (info, _) {
        if (!completer.isCompleted) completer.complete(info);
      },
      onError: (e, _) {
        if (!completer.isCompleted) completer.completeError(e);
      },
    );

    stream.addListener(_listener!);

    ImageInfo info;
    try {
      info = await completer.future;
    } on Exception catch (_) {
      return;
    } finally {
      stream.removeListener(_listener!);
    }

    final bytes = await info.image.toByteData();
    if (bytes == null || !mounted) return;
    final data = bytes.buffer.asUint8List();

    const sampleCount = 5000;
    final stride = max(1, (data.length ~/ 4) ~/ sampleCount);
    var r = 0;
    var g = 0;
    var b = 0;
    var count = 0;
    for (var i = 0; i < data.length; i += 4 * stride) {
      r += data[i];
      g += data[i + 1];
      b += data[i + 2];
      count++;
    }
    if (count == 0) return;
    final avg = Color.fromARGB(255, r ~/ count, g ~/ count, b ~/ count);
    final hsl = HSLColor.fromColor(avg);
    final dark = hsl.withLightness((hsl.lightness * 0.7).clamp(0.0, 1.0));
    final light = hsl.withLightness((hsl.lightness * 1.1).clamp(0.0, 1.0));

    if (mounted) {
      setState(() {
        _c1 = dark.toColor();
        _c2 = light.toColor();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final duration = widget.reducedMotion
        ? Duration.zero
        : const Duration(milliseconds: 200);

    final fallback1 = scheme.primaryContainer.withAlpha(191);
    final fallback2 = scheme.surface.withAlpha(191);

    final overlay = (isDark ? scheme.surface : scheme.surfaceContainerHighest)
        .withAlpha(isDark ? 64 : 31);

    final colors = widget.image == null
        ? [fallback1, fallback2]
        : [_c1.withAlpha(217), _c2.withAlpha(217)];

    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedContainer(
          duration: duration,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(color: overlay),
      ],
    );
  }
}
