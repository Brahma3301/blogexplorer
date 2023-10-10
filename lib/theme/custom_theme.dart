import 'package:flutter/material.dart';
import 'package:blogapp/theme/palette.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      primarySwatch: MaterialColor(Palette.grey500.value, const {
        100: Palette.grey100,
        200: Palette.grey200,
        300: Palette.grey300,
        400: Palette.grey400,
        500: Palette.grey500,
        600: Palette.grey600,
        700: Palette.grey700,
        800: Palette.grey800,
        900: Palette.grey900
      }),
      colorScheme: theme.colorScheme.copyWith(
        primary: Palette.grey500,
        secondary: Palette.grey300,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Palette.grey900,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.grey700,
      ),
      primaryTextTheme:
          theme.primaryTextTheme.copyWith().apply(displayColor: Colors.white),
      textTheme: theme.primaryTextTheme
          .copyWith(
            labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )
          .apply(displayColor: Colors.white),
    );
  }
}
