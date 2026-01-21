part of 'home_bloc.dart';

/// The events for the HomeBloc.
@MappableClass()
abstract class HomeEvent with HomeEventMappable {
  /// Creates a new instance of [HomeEvent].
  const HomeEvent();
}

/// Event to initialize the HomeBloc and fetch the first image.
@MappableClass()
class InitializeEvent extends HomeEvent with InitializeEventMappable {
  /// Creates a new instance of [InitializeEvent].
  const InitializeEvent();
}

/// Event to fetch the next image from the buffer or
/// fetch a new one if the buffer is empty.
@MappableClass()
class NextImageEvent extends HomeEvent with NextImageEventMappable {
  /// Creates a new instance of [NextImageEvent].
  const NextImageEvent();
}

/// Event to fetch another image and add it to the buffer.
@MappableClass()
class FetchAnotherImageEvent extends HomeEvent
    with FetchAnotherImageEventMappable {
  /// Creates a new instance of [FetchAnotherImageEvent].
  const FetchAnotherImageEvent();
}
