import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//! current seed color: FF803C
//! cool seed color:DD9D00, 00B1F4, E5C583
class AppTheme {
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
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.outline,
        ),
        gapPadding: 10,
      );
      var outlineFocusInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
        gapPadding: 10,
      );
      var outlineErrorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
        gapPadding: 10,
      );
      var outlineFocusErrorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.error,
          width: 2,
        ),
        gapPadding: 10,
      );
      return InputDecorationTheme(
          // labelStyle: const TextStyle(color: Colors.black),
          // floatingLabelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          //   if (states.contains(WidgetState.focused)) return TextStyle();
          //   return const TextStyle();
          // }),
          errorMaxLines: 5,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 10,
          ),
          enabledBorder: outlineEnableInputBorder,
          focusedBorder: outlineFocusInputBorder,
          errorBorder: outlineErrorInputBorder,
          focusedErrorBorder: outlineFocusErrorInputBorder);
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
      // scaffoldBackgroundColor: darkScheme().su,
      textTheme: appTextTheme,
      textButtonTheme: textButtonStyle,
      // textButtonTheme: TextButtonThemeData(style: ),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }
}

// ColorScheme syriaFreeScheme = ColorScheme.fromSeed(
//   seedColor: Colors.green,
// );

ColorScheme lightScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff415f91),
    surfaceTint: Color(0xff415f91),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffd6e3ff),
    onPrimaryContainer: Color(0xff001b3e),
    secondary: Color(0xff565f71),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffdae2f9),
    onSecondaryContainer: Color(0xff131c2b),
    tertiary: Color(0xff705575),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xfffad8fd),
    onTertiaryContainer: Color(0xff28132e),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfff9f9ff),
    onSurface: Color(0xff191c20),
    onSurfaceVariant: Color(0xff44474e),
    outline: Color(0xff74777f),
    outlineVariant: Color(0xffc4c6d0),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2e3036),
    inversePrimary: Color(0xffaac7ff),
    primaryFixed: Color(0xffd6e3ff),
    onPrimaryFixed: Color(0xff001b3e),
    primaryFixedDim: Color(0xffaac7ff),
    onPrimaryFixedVariant: Color(0xff284777),
    secondaryFixed: Color(0xffdae2f9),
    onSecondaryFixed: Color(0xff131c2b),
    secondaryFixedDim: Color(0xffbec6dc),
    onSecondaryFixedVariant: Color(0xff3e4759),
    tertiaryFixed: Color(0xfffad8fd),
    onTertiaryFixed: Color(0xff28132e),
    tertiaryFixedDim: Color(0xffddbce0),
    onTertiaryFixedVariant: Color(0xff573e5c),
    surfaceDim: Color(0xffd9d9e0),
    surfaceBright: Color(0xfff9f9ff),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff3f3fa),
    surfaceContainer: Color(0xffededf4),
    surfaceContainerHigh: Color(0xffe7e8ee),
    surfaceContainerHighest: Color(0xffe2e2e9),
  );
}


   ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaac7ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff0a305f),
      primaryContainer: Color(0xff284777),
      onPrimaryContainer: Color(0xffd6e3ff),
      secondary: Color(0xffbec6dc),
      onSecondary: Color(0xff283141),
      secondaryContainer: Color(0xff3e4759),
      onSecondaryContainer: Color(0xffdae2f9),
      tertiary: Color(0xffddbce0),
      onTertiary: Color(0xff3f2844),
      tertiaryContainer: Color(0xff573e5c),
      onTertiaryContainer: Color(0xfffad8fd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111318),
      onSurface: Color(0xffe2e2e9),
      onSurfaceVariant: Color(0xffc4c6d0),
      outline: Color(0xff8e9099),
      outlineVariant: Color(0xff44474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff415f91),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff284777),
      secondaryFixed: Color(0xffdae2f9),
      onSecondaryFixed: Color(0xff131c2b),
      secondaryFixedDim: Color(0xffbec6dc),
      onSecondaryFixedVariant: Color(0xff3e4759),
      tertiaryFixed: Color(0xfffad8fd),
      onTertiaryFixed: Color(0xff28132e),
      tertiaryFixedDim: Color(0xffddbce0),
      onTertiaryFixedVariant: Color(0xff573e5c),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33353a),
    );
  }

