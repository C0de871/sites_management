import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//! current seed color: FF803C
//! cool seed color:DD9D00, 00B1F4, E5C583
class AppTheme {
  const AppTheme();

  ThemeData theme(ColorScheme colorScheme) {
    TextButtonThemeData textButtonStyle = TextButtonThemeData(
        style: TextButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: colorScheme.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ));

    InputDecorationTheme inputDecorationTheme() {
      var outlineEnableInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.outline,
        ),
      );
      var outlineFocusInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
      );
      var outlineErrorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
      );
      var outlineFocusErrorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.error,
          width: 2,
        ),
      );
      return InputDecorationTheme(
        errorMaxLines: 5,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: outlineEnableInputBorder,
        focusedBorder: outlineFocusInputBorder,
        errorBorder: outlineErrorInputBorder,
        focusedErrorBorder: outlineFocusErrorInputBorder,
      );
    }

    TextTheme appTextTheme = TextTheme(
      labelLarge: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.labelLarge!.copyWith(
                color: colorScheme.onSurfaceVariant,
              )
          : ThemeData.light().textTheme.labelLarge!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
      displaySmall: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              )
          : ThemeData.light().textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              ),
      displayMedium: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              )
          : ThemeData.light().textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              ),
      headlineMedium: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.headlineMedium!.copyWith(
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cairo().fontFamily,
                leadingDistribution: TextLeadingDistribution.even,
              )
          : ThemeData.light().textTheme.headlineMedium!.copyWith(
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cairo().fontFamily,
                leadingDistribution: TextLeadingDistribution.even,
              ),
      titleMedium: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.titleMedium!.copyWith(
                color: colorScheme.primary,
              )
          : ThemeData.light().textTheme.titleMedium!.copyWith(
                color: colorScheme.primary,
              ),
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.brightness == Brightness.dark ? darkScheme().surface : Colors.white,
      textTheme: appTextTheme,
      textButtonTheme: textButtonStyle,
      extensions: const [
        ExtentionColors(),
      ],
      inputDecorationTheme: inputDecorationTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff705d00),
      surfaceTint: Color(0xff705d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd700),
      onPrimaryContainer: Color(0xff705e00),
      secondary: Color(0xff6d5d1a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff8e290),
      onSecondaryContainer: Color(0xff74631f),
      tertiary: Color(0xff506600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc2e84f),
      onTertiaryContainer: Color(0xff516700),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff9ef),
      onSurface: Color(0xff1f1b10),
      onSurfaceVariant: Color(0xff4d4732),
      outline: Color(0xff7e775f),
      outlineVariant: Color(0xffd0c6ab),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343024),
      inversePrimary: Color(0xffe9c400),
      primaryFixed: Color(0xffffe16d),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffe9c400),
      onPrimaryFixedVariant: Color(0xff544600),
      secondaryFixed: Color(0xfff8e290),
      onSecondaryFixed: Color(0xff221b00),
      secondaryFixedDim: Color(0xffdbc677),
      onSecondaryFixedVariant: Color(0xff544601),
      tertiaryFixed: Color(0xffcbf157),
      onTertiaryFixed: Color(0xff161f00),
      tertiaryFixedDim: Color(0xffafd43d),
      onTertiaryFixedVariant: Color(0xff3c4d00),
      surfaceDim: Color(0xffe1d9c7),
      surfaceBright: Color(0xfffff9ef),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e0),
      surfaceContainer: Color(0xfff6edda),
      surfaceContainerHigh: Color(0xfff0e7d5),
      surfaceContainerHighest: Color(0xffeae2cf),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff6df),
      surfaceTint: Color(0xffe9c400),
      onPrimary: Color(0xff3a3000),
      primaryContainer: Color(0xffffd700),
      onPrimaryContainer: Color(0xff705e00),
      secondary: Color(0xffdbc677),
      onSecondary: Color(0xff3a3000),
      secondaryContainer: Color(0xff544601),
      onSecondaryContainer: Color(0xffc9b468),
      tertiary: Color(0xffebffad),
      onTertiary: Color(0xff283500),
      tertiaryContainer: Color(0xffc2e84f),
      onTertiaryContainer: Color(0xff516700),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff161308),
      onSurface: Color(0xffeae2cf),
      onSurfaceVariant: Color(0xffd0c6ab),
      outline: Color(0xff999077),
      outlineVariant: Color(0xff4d4732),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae2cf),
      inversePrimary: Color(0xff705d00),
      primaryFixed: Color(0xffffe16d),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffe9c400),
      onPrimaryFixedVariant: Color(0xff544600),
      secondaryFixed: Color(0xfff8e290),
      onSecondaryFixed: Color(0xff221b00),
      secondaryFixedDim: Color(0xffdbc677),
      onSecondaryFixedVariant: Color(0xff544601),
      tertiaryFixed: Color(0xffcbf157),
      onTertiaryFixed: Color(0xff161f00),
      tertiaryFixedDim: Color(0xffafd43d),
      onTertiaryFixedVariant: Color(0xff3c4d00),
      surfaceDim: Color(0xff161308),
      surfaceBright: Color(0xff3d392c),
      surfaceContainerLowest: Color(0xff110e05),
      surfaceContainerLow: Color(0xff1f1b10),
      surfaceContainer: Color(0xff231f14),
      surfaceContainerHigh: Color(0xff2e2a1e),
      surfaceContainerHighest: Color(0xff393528),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }
}

class ExtendedColor {
  final Color ex;

  const ExtendedColor({required this.ex});
}

@immutable
class ExtentionColors extends ThemeExtension<ExtentionColors> {
  const ExtentionColors();

  final ExtendedColor _lightExtendedColor = const ExtendedColor(
    ex: Colors.white,
  );

  final ExtendedColor _darkExtendedColor = const ExtendedColor(
    ex: Colors.black,
  );

  @override
  ExtentionColors copyWith() {
    return const ExtentionColors();
  }

  ExtendedColor extendedColorScheme(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return _darkExtendedColor;
    } else {
      return _lightExtendedColor;
    }
  }

  @override
  ExtentionColors lerp(ThemeExtension<ExtentionColors>? other, double t) {
    if (other is! ExtentionColors) return this;
    return const ExtentionColors();
  }
}
