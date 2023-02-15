import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/presentation/resource/app_size.dart';
import 'package:music_player_app/presentation/resource/color_manager.dart';
import 'package:music_player_app/presentation/view/player_details.dart';

import 'package:on_audio_query/on_audio_query.dart';

class ItemSong extends StatelessWidget {
  final List<SongModel> songModelList;
  final controller;
  final index;
  const ItemSong(
      {Key? key,
      required this.songModelList,
      required this.controller,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15)),
        tileColor: ColorManager.bg,
        title: Text(songModelList[index].displayNameWOExt),
        subtitle: Text("${songModelList[index].artist}"),
        leading: QueryArtworkWidget(
          id: songModelList[index].id,
          type: ArtworkType.ARTIST,
          nullArtworkWidget: const Icon(
            Icons.music_note,
            color: ColorManager.white,
            size: AppSize.s30,
          ),
        ),
        trailing:
            controller.playIndex.value == index && controller.isPlaying.value
                ? const Icon(Icons.play_arrow)
                : null,
        onTap: () {
          Get.to(() => PlayerDetails(
                songModelList: songModelList,
                controller: controller,
                index: index,
              ),transition: Transition.downToUp
          );
          controller.playSong(url: songModelList[index].uri,index:index);
        });
  }
}
