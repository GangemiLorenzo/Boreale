import 'package:flutter/material.dart';

/// A widget that displays the central image with animated transitions.
/// Displays a placeholder while the image is loading.
class CentralImage extends StatelessWidget {
  /// Creates a new instance of [CentralImage].
  const CentralImage({
    required this.side,
    required this.imageSwitchDuration,
    required this.currentImage,
    super.key,
  });

  /// The side length of the square image container.
  final double side;

  /// The duration of the image switch animation.
  final Duration imageSwitchDuration;

  /// The current image to display.
  final ImageProvider? currentImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: side,
          height: side,
          child: AnimatedSwitcher(
            duration: imageSwitchDuration,
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: currentImage != null
                ? KeyedSubtree(
                    key: ValueKey(currentImage),
                    child: Semantics(
                      label: 'Photo from API',
                      image: true,
                      child: SizedBox.expand(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: currentImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const _PlaceholderImage(),
          ),
        ),
      ),
    );
  }
}

/// A placeholder widget displayed while an image is loading.
class _PlaceholderImage extends StatelessWidget {
  /// Creates a new instance of [_PlaceholderImage].
  const _PlaceholderImage();

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: const ValueKey('placeholder'),
      child: Semantics(
        label: 'Loading image',
        child: const Center(
          child: SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
