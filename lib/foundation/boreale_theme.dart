import 'package:flutter/material.dart';

/// Centralized theme definitions for Boreale.
class BorealeTheme {
  BorealeTheme._();

  // Base palette from provided tokens.
  static const Color _bg = Color(0xFF0D0D0D);
  static const Color _bgLight = Color(0xFF141414);
  static const Color _bgDark = Color(0xFF1A1A1A);
  static const Color _text = Color(0xFFFFFFFF);
  static const Color _textMuted = Color(0xB3FFFFFF);
  static const Color _textDimmed = Color(0x80FFFFFF);
  static const Color _accent = Color(0xFFFF8000);
  static const Color _accentLight = Color(0x4DFF8000);

  // Light inversions for usability.
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightSurfaceVariant = Color(0xFFE8E8E8);
  static const Color _lightText = Color(0xFF0D0D0D);
  static const Color _lightTextMuted = Color(0xB3000000);
  static const Color _lightTextDimmed = Color(0x80000000);

  /// Light color palette.
  static ThemeData get light => _buildLight();

  /// Dark color palette.
  static ThemeData get dark => _buildDark();

  static ThemeData _buildLight() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: _accent,
      onPrimary: _lightSurface,
      secondary: _accentLight,
      onSecondary: _lightText,
      error: Color(0xFFBA1B1B),
      onError: _lightSurface,
      surface: _lightSurface,
      onSurface: _lightText,
      surfaceContainerHighest: _lightSurfaceVariant,
      onSurfaceVariant: _lightTextMuted,
      outline: Color(0x33000000),
      scrim: Colors.black,
      shadow: Colors.black,
      inverseSurface: _lightText,
      onInverseSurface: _lightSurface,
      inversePrimary: _accent,
    );

    return _baseTheme(scheme);
  }

  static ThemeData _buildDark() {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: _accent,
      onPrimary: _bg,
      secondary: _accentLight,
      onSecondary: _bg,
      error: Color(0xFFFFB4A9),
      onError: _bg,
      surface: _bgLight,
      onSurface: _text,
      surfaceContainerHighest: _bgDark,
      onSurfaceVariant: _textMuted,
      outline: Color(0x4DFFFFFF),
      scrim: Colors.black,
      shadow: Colors.black,
      inverseSurface: _text,
      onInverseSurface: _bg,
      inversePrimary: _accent,
    );

    return _baseTheme(scheme);
  }

  static ThemeData _baseTheme(ColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: scheme.surface,
      disabledColor: scheme.brightness == Brightness.dark
          ? _textDimmed
          : _lightTextDimmed,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
