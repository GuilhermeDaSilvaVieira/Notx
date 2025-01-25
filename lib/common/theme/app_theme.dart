import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notx/common/theme/app_pallete.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData.light(useMaterial3: true).copyWith(
      // Color Scheme
      brightness: Brightness.light,
      primaryColor: AppPallete.lightPrimary,
      scaffoldBackgroundColor: AppPallete.lightBackground,

      // Text Theme
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppPallete.lightOnBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: AppPallete.lightOnBackground,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppPallete.lightPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppPallete.lightBackground,
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(color: AppPallete.lightPrimary),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: AppPallete.transparent,
          systemNavigationBarColor: AppPallete.lightBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        color: AppPallete.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: AppPallete.lightPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Input Decoration Theme (for TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPallete.lightInputFill,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.lightOnBackground,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.lightPrimary,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.lightPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // ListTile Theme
      listTileTheme: ListTileThemeData(
        tileColor: AppPallete.lightTileBackground,
        iconColor: AppPallete.lightDeleteButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // IconButton Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppPallete.lightPrimary,
        ),
      ),
    );
  }

  // Dark theme (optional, can be used for dark mode)
  static ThemeData get dark {
    return ThemeData.dark(useMaterial3: true).copyWith(
      // Color Scheme
      brightness: Brightness.dark,
      primaryColor: AppPallete.darkPrimary,
      scaffoldBackgroundColor: AppPallete.darkBackground,

      // Text Theme
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppPallete.darkOnBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: AppPallete.darkOnBackground,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppPallete.darkPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppPallete.darkOnBackground,
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(color: AppPallete.darkPrimary),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppPallete.transparent,
          systemNavigationBarColor: AppPallete.darkBackground,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        color: AppPallete.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: AppPallete.darkPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Input Decoration Theme (for TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPallete.darkInputFill,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.darkOnBackground,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppPallete.darkPrimary,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.darkPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // ListTile Theme
      listTileTheme: ListTileThemeData(
        tileColor: AppPallete.darkTileBackground,
        iconColor: AppPallete.darkDeleteButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // IconButton Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppPallete.darkPrimary,
        ),
      ),
    );
  }
}
