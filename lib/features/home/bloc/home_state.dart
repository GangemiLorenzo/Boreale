part of 'home_bloc.dart';

/// The state of the HomeBloc.
@MappableClass()
class HomeState with HomeStateMappable {
  /// Creates a new instance of [HomeState].
  const HomeState({
    required this.isLoading,
    this.currentImage,
    this.buffer = const [],
    this.error,
  });

  /// Creates an empty [HomeState].
  factory HomeState.empty() => const HomeState(isLoading: false);

  /// Creates a copy of the current [HomeState] with optional new values.
  final bool isLoading;

  /// The current image being displayed.
  final ImageProvider? currentImage;

  /// The buffer of pre-fetched images.
  final List<ImageProvider> buffer;

  /// Any error that occurred during image fetching.
  final Object? error;
}
