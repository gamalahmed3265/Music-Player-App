import 'package:flutter/material.dart';
import 'package:music_player_app/presentation/common/item_song.dart';
import 'package:music_player_app/presentation/resource/app_size.dart';

import 'package:on_audio_query/on_audio_query.dart';

class Body extends StatelessWidget {
  final List<SongModel> songModel;
  final controller;
  const Body({Key? key, required this.songModel,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: songModel.length,
          separatorBuilder: (context, index) =>const SizedBox(
                height: AppSize.s10,
              ),
          itemBuilder: (context, index) => ItemSong(
            songModelList: songModel,
            controller:controller,
            index: index,)

      ),
    );
  }
}
