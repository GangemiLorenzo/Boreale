import 'package:flutter/material.dart';

/// A widget that displays the current count of buffered images.
class BufferCounter extends StatelessWidget {
  /// Creates a new instance of [BufferCounter].
  const BufferCounter({
    required this.buffer,
    super.key,
  });

  /// The current buffer of images.
  final List<ImageProvider> buffer;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 12,
      right: 12,
      child: Semantics(
        label: 'Buffered images: ${buffer.length}',
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(102),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: Text(
              'Buffer: ${buffer.length}',
              style:
                  Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
