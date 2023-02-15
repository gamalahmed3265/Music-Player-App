import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/presentation/resource/router_manager.dart';
import 'package:music_player_app/presentation/resource/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music Player App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode.dark,
      onGenerateRoute: RoutGenerator.getRouters,
      initialRoute: RouterManager.homePage,
    );
  }
}
