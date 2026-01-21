import 'dart:async';

import 'package:boreale/features/home/bloc/image_fetching_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_bloc.mapper.dart';
part 'home_event.dart';
part 'home_state.dart';

/// Options for configuring the HomeBloc.
class HomeBlocOptions {
  /// Creates a new instance of [HomeBlocOptions].
  const HomeBlocOptions({
    this.imageConfiguration = ImageConfiguration.empty,
    this.bufferSize = 3,
  });

  /// Defines the buffer size for prefetching images.
  final int bufferSize;

  /// Configuration for image fetching.
  /// Helps in defining parameters like device pixel ratio, size, etc.
  final ImageConfiguration imageConfiguration;
}

/// Bloc to manage the state of the home feature,
/// including image fetching and buffering.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Creates a new instance of [HomeBloc].
  HomeBloc({
    required this.imageFetchingRepo,
    this.options = const HomeBlocOptions(),
  }) : super(HomeState.empty()) {
    on<InitializeEvent>(_initialize);
    on<NextImageEvent>(_nextImage);
    on<FetchAnotherImageEvent>(_fetchAnotherImage);
  }

  /// Repository for fetching images.
  final ImageFetchingRepo imageFetchingRepo;

  /// Configuration options for the HomeBloc.
  final HomeBlocOptions options;

  Future<void> _initialize(
    InitializeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    ImageProvider firstImage;
    try {
      firstImage = await imageFetchingRepo.fetchRandomImage(
        configuration: options.imageConfiguration,
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          error: e,
        ),
      );
      add(const NextImageEvent());
      return;
    }

    emit(
      state.copyWith(
        isLoading: false,
        currentImage: firstImage,
        buffer: [],
        error: null,
      ),
    );

    for (final _ in Iterable<int>.generate(options.bufferSize)) {
      add(const FetchAnotherImageEvent());
    }
  }

  Future<void> _nextImage(
    NextImageEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.buffer.isNotEmpty) {
      final next = state.buffer.first;
      emit(
        state.copyWith(
          isLoading: false,
          currentImage: next,
          buffer: state.buffer.sublist(1),
          error: null,
        ),
      );

      add(const FetchAnotherImageEvent());
      return;
    }

    // Fallback when buffer is empty
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final image = await imageFetchingRepo.fetchRandomImage(
        configuration: options.imageConfiguration,
      );
      emit(
        state.copyWith(
          isLoading: false,
          currentImage: image,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      emit(
        state.copyWith(
          error: e,
        ),
      );
      rethrow;
    }
  }

  Future<void> _fetchAnotherImage(
    FetchAnotherImageEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.buffer.length >= options.bufferSize) return;
    try {
      final newImage = await imageFetchingRepo.fetchRandomImage(
        configuration: options.imageConfiguration,
      );

      emit(
        state.copyWith(
          error: null,
          buffer: [...state.buffer, newImage],
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          error: e,
        ),
      );
      add(const FetchAnotherImageEvent());
    }
  }

  @override
  Future<void> close() {
    imageFetchingRepo.dispose();
    return super.close();
  }
}
