import 'package:boreale/features/home/bloc/bloc.dart';
import 'package:boreale/features/home/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Builder widget to provide HomeBloc to the HomePage.
class HomePageBuilder extends StatelessWidget {
  /// Creates a new instance of [HomePageBuilder].
  const HomePageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final side = MediaQuery.sizeOf(context).width * 0.8;
    final imageConfig = createLocalImageConfiguration(
      context,
      size: Size.square(side),
    );
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        imageFetchingRepo: ImageFetchingRepo(),
        options: HomeBlocOptions(
          imageConfiguration: imageConfig,
          bufferSize: 5,
        ),
      )..add(const InitializeEvent()),
      child: Builder(
        builder: (context) {
          return const HomePage();
        },
      ),
    );
  }
}

/// The main page displaying images fetched from the API.
class HomePage extends StatelessWidget {
  /// Creates a new instance of [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final side = media.size.width * 0.8;
    final reducedMotion = media.disableAnimations;
    final imageSwitchDuration = reducedMotion
        ? Duration.zero
        : const Duration(milliseconds: 500);

    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) async {
          if (state.buffer.isNotEmpty) {
            await precacheImage(
              state.buffer.last,
              context,
            );
          }
          if (state.error != null && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error: ${state.error}',
                  semanticsLabel: 'Error: ${state.error}',
                ),
                behavior: SnackBarBehavior.floating,
                showCloseIcon: true,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: AdaptiveGradientBackground(
                  image: state.currentImage,
                  configuration: createLocalImageConfiguration(
                    context,
                    size: Size.square(side),
                  ),
                  reducedMotion: reducedMotion,
                ),
              ),
              if (state.buffer.isNotEmpty) BufferCounter(buffer: state.buffer),
              CentralImage(
                side: side,
                imageSwitchDuration: imageSwitchDuration,
                currentImage: state.currentImage,
              ),
              if (state.currentImage != null)
                AnotherCTA(isLoading: state.isLoading),
            ],
          );
        },
      ),
    );
  }
}
