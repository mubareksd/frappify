import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// {@template app_theme}
/// The Default App [ShadThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ShadThemeData` for App UI.
  ShadThemeData get themeData => ShadThemeData(
        colorScheme: _colorScheme,
        brightness: Brightness.light,
        textTheme: _textTheme,
      );

  ShadColorScheme get _colorScheme => const ShadColorScheme(
        primary: AppColors.blue,
        primaryForeground: Color(0xffF8FAFC),
        background: AppColors.background,
        foreground: Color(0xff0F172A),
        card: AppColors.background,
        cardForeground: Color(0xff0F172A),
        popover: AppColors.background,
        popoverForeground: Color(0xff0F172A),
        secondary: Color(0xff0F172A),
        secondaryForeground: Color(0xff0F172A),
        destructive: Color(0xffEF4444),
        destructiveForeground: Color(0xffF8FAFC),
        accent: Color(0xffF1F5F9),
        accentForeground: Color(0xff0F172A),
        muted: Color(0xff0F172A),
        mutedForeground: Color(0xff64748B),
        border: Color(0xffE5E7EB),
        input: Color(0xffE5E7EB),
        ring: Color(0xff3B82F6),
        selection: Color(0xFFB4D7FF),
      );

  ShadTextTheme get _textTheme => uiTextTheme;

  /// Default `ShadTextTheme` for App UI.
  static final contentTextTheme = ShadTextTheme(
    h1: ContentTextStyle.headline1,
    h2: ContentTextStyle.headline2,
    h3: ContentTextStyle.headline3,
    h4: ContentTextStyle.headline4,
    blockquote: ContentTextStyle.headline4,
    h1Large: ContentTextStyle.headline1.copyWith(fontSize: 48),
    large: ContentTextStyle.headline2.copyWith(fontSize: 36),
    lead: ContentTextStyle.headline3.copyWith(fontSize: 24),
    list: ContentTextStyle.headline4.copyWith(fontSize: 20),
    muted: ContentTextStyle.headline4.copyWith(fontSize: 16),
    p: ContentTextStyle.headline4.copyWith(fontSize: 16),
    small: ContentTextStyle.headline4.copyWith(fontSize: 14),
    table: ContentTextStyle.headline4.copyWith(fontSize: 14),
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  /// Default `ShadTextTheme` for UI.
  static final uiTextTheme = ShadTextTheme(
    h1: UITextStyle.headline1,
    h2: UITextStyle.headline2,
    h3: UITextStyle.headline3,
    h4: UITextStyle.headline4,
    blockquote: UITextStyle.headline4,
    h1Large: UITextStyle.headline1.copyWith(fontSize: 48),
    large: UITextStyle.headline2.copyWith(fontSize: 36),
    lead: UITextStyle.headline3.copyWith(fontSize: 24),
    list: UITextStyle.headline4.copyWith(fontSize: 20),
    muted: UITextStyle.headline4.copyWith(fontSize: 16),
    p: UITextStyle.headline4.copyWith(fontSize: 16),
    small: UITextStyle.headline4.copyWith(fontSize: 14),
    table: UITextStyle.headline4.copyWith(fontSize: 14),
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );
}

/// {@template app_dark_theme}
/// Dark Mode App [ShadThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  @override
  ShadThemeData get themeData => ShadThemeData(
        colorScheme: _colorScheme,
        brightness: Brightness.dark,
        textTheme: _textTheme,
      );

  @override
  ShadColorScheme get _colorScheme => const ShadColorScheme(
        primary: AppColors.blue,
        primaryForeground: Color(0xffF8FAFC),
        background: AppColors.darkBackground,
        foreground: Color(0xffF8FAFC),
        card: AppColors.darkBackground,
        cardForeground: Color(0xffF8FAFC),
        popover: AppColors.darkBackground,
        popoverForeground: Color(0xffF8FAFC),

        secondary: Color(0xff0F172A),
        secondaryForeground: Color(0xffF8FAFC),
        destructive: Color(0xffEF4444),
        destructiveForeground: Color(0xffF8FAFC),
        accent: Color(0xffF1F5F9),
        accentForeground: Color(0xff0F172A),
        muted: Color(0xff0F172A),
        mutedForeground: Color(0xff64748B),
        border: Color(0xff374151),
        input: Color(0xff374151),
        ring: Color(0xff3B82F6),
        selection: Color(0xFFB4D7FF),
      );

  @override
  ShadTextTheme get _textTheme {
    return AppTheme.contentTextTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      decorationColor: AppColors.white,
    );
  }
}
