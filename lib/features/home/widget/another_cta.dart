import 'package:boreale/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A call-to-action button to fetch another image.
class AnotherCTA extends StatelessWidget {
  /// Creates a new instance of [AnotherCTA].
  const AnotherCTA({required this.isLoading, super.key});

  /// Whether an image is currently being loaded.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 16,
      left: 16,
      child: SafeArea(
        child: Semantics(
          button: true,
          label: 'Fetch another image',
          child: ElevatedButton(
            onPressed: !isLoading
                ? () {
                    context.read<HomeBloc>().add(
                      const NextImageEvent(),
                    );
                  }
                : null,
            child: !isLoading
                ? const Text('Another')
                : const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
