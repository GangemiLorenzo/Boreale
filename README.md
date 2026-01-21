# Boreale

Boreale is a Flutter application designed to fetch and display random images from a remote API, with a focus on smooth user experience.

https://github.com/user-attachments/assets/e15e019c-fefa-41fe-a89c-7b3425391593

## Project Structure & Architecture

The app uses the BLoC pattern for state management. The main components are organized as follows:

- **lib/main.dart**: Entry point, initializes the app.
- **lib/foundation/**: Core app setup and theming.
	- `boreale_app.dart`: Main app widget, sets up themes and home page.
	- `boreale_theme.dart`: Light and dark theme definitions.
- **lib/features/home/**: Home feature module.
	- **bloc/**: Business logic and state management.
		- `home_bloc.dart`, `home_event.dart`, `home_state.dart`: BLoC implementation for image fetching and buffering.
		- `image_fetching_repo.dart`: Repository for API communication and image pre-resolution.
	- **view/**: UI pages.
		- `home_page.dart`: Main page displaying images and buffer status.
	- **widget/**: Reusable UI components.
		- `central_image.dart`: Animated image display.
		- `buffer_counter.dart`: Shows the current buffer size.
		- `adaptive_gradient_background.dart`, `another_cta.dart`: Additional UI widgets.

## Dependencies

- **flutter_bloc**: State management using the BLoC pattern.
- **http**: For API requests.
- **dart_mappable**: Data mapping and serialization.
- **very_good_analysis**: Linting and code quality.

See [pubspec.yaml](pubspec.yaml) for the full list.


## Image Fetching & Pre-Resolution

Image fetching is handled at the repository level (`image_fetching_repo.dart`). 
Before an image is displayed, the app performs a *pre-resolution* step:

- The image is fetched from the API.
- The app attempts to resolve the image with the current device configuration.
- If the image cannot be loaded (e.g., network error, invalid URL), an error is thrown before updating the UI.

Whenever fetching an image fails, the error is caught and an error state is emitted by the BLoC. This results in a snackbar being shown on the screen, providing immediate feedback to the user about the failure.

Hiding the error snackbar can be considered an improvement to reduce the disruption to the user experience. For the sake of this implementation, the snackbar is currently used to inform users of issues.

This ensures that only valid images are passed to the UI and that errors are handled gracefully.

## Buffer Functionality

Although not specifically required, Boreale implements a buffer for pre-fetching images, managed by the BLoC:

- The buffer holds a configurable number of images, ready to be displayed.
- When the user requests the next image, it is instantly available from the buffer, minimizing wait time.
- The buffer is visualized in the UI via the `BufferCounter` widget.

This feature was not required by the original specifications but was added as it improves user experience.

## Caching Strategy

Outside of the buffer, no additional caching is implemented. Since images are fetched randomly from the API, the likelihood of displaying the same image again is very low. This design keeps memory usage efficient and avoids unnecessary complexity.

## Recording

### Without buffer
https://github.com/user-attachments/assets/fcc42ea9-ff9e-44f4-a40a-b2d37ebc308a

### With buffer
https://github.com/user-attachments/assets/3a177290-fcda-42ce-be40-a7c0f742d64f


## Ideal project stack

Given the project requirements, there were no needs for a more complete stack of dependencies.

If that would be the case, this is the stack I would follow:
- **flutter_bloc**: State management using the BLoC pattern.
- **dio**: For API requests.
- **dart_mappable/freezed**: Data mapping and serialization.
- **get_it**: Dependencies injection.
- **envied**: Environment variables.
- **mocktail/Patrol**: Testing.
- **go_router**: Routing.

I would have implemented primarly E2E integration tests for the main app flows.
Unit tests only for services and repos.

I normally configure dev, staging and production flavors, each one with custom feature flags.



