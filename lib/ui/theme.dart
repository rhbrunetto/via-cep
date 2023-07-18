import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import 'colors.dart';

class AvaThemeData {
  const AvaThemeData._({
    required this.backgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.brightness,
    required this.dividerColor,
    required this.highlightColor,
  });

  const AvaThemeData.dark()
      : this._(
          brightness: Brightness.light,
          backgroundColor: AvaColors.navy,
          primaryTextColor: AvaColors.lightSlate,
          secondaryTextColor: AvaColors.lightestSlate,
          dividerColor: AvaColors.lightNavy,
          highlightColor: AvaColors.green,
        );

  final Color backgroundColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Brightness brightness;
  final Color dividerColor;
  final Color highlightColor;

  TextStyle get _baseTextStyle => TextStyle(
        height: 1.25,
        color: primaryTextColor,
        fontFamily: FontFamily.lato,
      );

  ButtonStyle get _buttonStyle => ButtonStyle(
        animationDuration: Duration.zero,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStateProperty.all(AvaColors.navy),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.hovered)
              ? AvaColors.green
              : AvaColors.lightSlate,
        ),
        iconColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.hovered)
              ? AvaColors.green
              : AvaColors.lightSlate,
        ),
      );

  ThemeData toMaterialTheme() => ThemeData(
        brightness: brightness,
        splashColor: Colors.transparent,
        hoverColor: AvaColors.green,
        fontFamily: FontFamily.lato,
        textButtonTheme: TextButtonThemeData(style: _buttonStyle),
        textTheme: TextTheme(
          displayLarge: _baseTextStyle.copyWith(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: _baseTextStyle.copyWith(
            fontSize: 42,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: _baseTextStyle.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: _baseTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: _baseTextStyle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: _baseTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: _baseTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: _baseTextStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.light(
          brightness: brightness,
          primary: AvaColors.lightSlate,
          secondary: AvaColors.lightestSlate,
          background: backgroundColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          titleTextStyle: _baseTextStyle.copyWith(
            fontSize: 17,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
            letterSpacing: .23,
          ),
          foregroundColor: primaryTextColor,
        ),
        canvasColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        highlightColor: AvaColors.green,
        hintColor: AvaColors.green,
        dividerColor: dividerColor,
      );
}
