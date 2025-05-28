import 'package:app_ui/src/colors/color_pair.dart';
import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
abstract class AppColors {
  /// Black
  static const Color black = Color(0xFF000000);

  /// Light black
  static const ColorPair lightBlack = ColorPair(
    light: Color(0xff232323),
    dark: Color(0xFFE5E5E5),
  );

  /// White
  static const Color white = Color(0xFFFFFFFF);
  static const ColorPair whitePair = ColorPair(
    light: Colors.white,
    dark: Colors.black,
  );

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// The grey primary color and swatch.
  static const MaterialColor grey = Colors.grey;
  static const ColorPair greyPair = ColorPair(
    light: Colors.grey,
    dark: Color(0xFFC4C4C4),
  );

  /// The blue primary color and swatch.
  static const Color blue = Color(0xFF3898EC);

  /// The background color.
  static const Color background = Color(0xFFFFFFFF);

  /// The dark background color.
  static const Color darkBackground = Color(0xFF010D11);

  /// The dark background color.
  static const ColorPair darkGrey = ColorPair(
    light: Color(0xff7c7c7c),
    dark: Color(0xFFB3B3B3),
  );

  /// The dark background color.
  static const ColorPair lightGrey = ColorPair(
    light: Color(0xfff3f3f3),
    dark: Color(0xff232323),
  );

  /// The dark background color.
  static const ColorPair darkBorderGrey = ColorPair(
    light: Color(0xFFC7C7C7),
    dark: Color(0xFFE0E0E0),
  );

  /// The dark background color.
  static const ColorPair lightBorderGrey = ColorPair(
    light: Color(0xFFC7C7C7),
    dark: Color(0xFFE0E0E0),
  );
}
