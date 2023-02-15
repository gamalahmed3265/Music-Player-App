import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player_app/presentation/resource/color_manager.dart';
import 'package:music_player_app/presentation/resource/style.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(


  );
  static ThemeData darkTheme = ThemeData(


  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorManager.bgDarkColor,
  appBarTheme: AppBarTheme(


  systemOverlayStyle:const SystemUiOverlayStyle(
  //status bar
  statusBarColor: Colors.transparent, // <-- SEE HERE
  statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
  //Navigation

    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarBrightness: Brightness.light,//status bar brigtness
    systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon


  ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle:ourStyle(fontSize: 18)
  ),
  );
}
