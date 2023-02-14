import 'package:flutter/material.dart';
import 'package:music_player_app/presentation/resource/theme.dart';
import 'package:music_player_app/presentation/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}
