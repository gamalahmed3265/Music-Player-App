import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/presentation/common/app_custom.dart';
import 'package:music_player_app/presentation/common/body_custom_list.dart';
import 'package:music_player_app/presentation/controller/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
        appBar: AppCustom(),
        body: FutureBuilder<List<SongModel>>(
          future: controller.audioQuary.querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              uriType: UriType.EXTERNAL),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              print(snapshot.data);
              return const Center(
                child: Text("Not Found Song"),
              );
            } else {
              return Body(songModel: snapshot.data!, controller: controller);
            }
          },
        ));
  }
}
