import 'package:flutter/material.dart';
import 'package:music_player_app/presentation/view/home_page.dart';
import 'package:music_player_app/presentation/view/player_details.dart';

// import '../../app/di.dart';

class RouterManager {
  static const String homePage = "/";
  static const String details = "/details";
}

class RoutGenerator {
  static Route<dynamic> getRouters(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterManager.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      // case RouterManager.details:
      //   return MaterialPageRoute(builder: (_) => const PlayerDetails(songModel: songModel));

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found Page"),
      ),
      body: const Center(child: Text("Not Found Page")),
    );
  }
}
