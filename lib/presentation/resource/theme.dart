import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player_app/presentation/resource/color_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorManager.white,
      // brightness: Brightness.light,

      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: ColorManager.kTextColor,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white10,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: ColorManager.white));
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
