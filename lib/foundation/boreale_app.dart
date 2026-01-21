import 'package:boreale/features/home/view/home_page.dart';
import 'package:boreale/foundation/boreale_theme.dart';
import 'package:flutter/material.dart';

/// The main application widget.
class BorealeApp extends StatelessWidget {
  /// Creates a [BorealeApp] instance.
  const BorealeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boreale',
      theme: BorealeTheme.light,
      darkTheme: BorealeTheme.dark,
      home: const HomePageBuilder(),
    );
  }
}
