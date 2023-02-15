import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/presentation/common/app_custom.dart';
import 'package:music_player_app/presentation/resource/app_size.dart';
import 'package:music_player_app/presentation/resource/color_manager.dart';
import 'package:music_player_app/presentation/resource/style.dart';

import 'package:on_audio_query/on_audio_query.dart';

class PlayerDetails extends StatelessWidget {
  final List<SongModel> songModelList;
  final controller;
  final index;
  const PlayerDetails(
      {Key? key,
      required this.songModelList,
      required this.controller,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustom(),
      body: Column(
        children: [
          Obx(()=>
              Expanded(
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: AppSize.s300_0,
                    width: AppSize.s300_0,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: QueryArtworkWidget(
                      id: songModelList[index].id,
                      type: ArtworkType.AUDIO,
                      artworkHeight: double.infinity,
                      artworkWidth: double.infinity,
                      nullArtworkWidget:
                      const Icon(Icons.music_note, size: AppSize.s50),
                    )),
              )
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(AppSize.s15),
                decoration: const BoxDecoration(
                    color: ColorManager.bg,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppSize.s16))),
                alignment: Alignment.center,
                child: Obx(
                  () => Column(
                    children: [
                      Text(
                        songModelList[index].displayNameWOExt,
                        style: ourStyle(fontSize: AppSize.s20),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        "${songModelList[index].artist}",
                        style: ourStyle(fontSize: AppSize.s16),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              controller.position.value,
                              style: ourStyle(),
                            ),
                            Expanded(
                                child: Slider(
                              thumbColor: ColorManager.sliderColor,
                              inactiveColor: ColorManager.bgDarkColor,
                              activeColor: ColorManager.sliderColor,
                              min: const Duration(seconds: 0)
                                  .inSeconds
                                  .toDouble(),
                              max: controller.max.value,
                              value: controller.value.value,
                              onChanged: (newValue) {
                                controller
                                    .changeDurationToSeconde(newValue.toInt());
                                newValue = newValue;
                              },
                            )),
                            Text(
                              controller.duration.value,
                              style: ourStyle(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.playSong(
                                    songModelList[controller.playIndex.value-1].uri,
                                    controller.playIndex.value - 1);
                              },
                              icon: const Icon(
                                Icons.skip_previous_rounded,
                                size: AppSize.s40,
                              )),
                          Obx(
                            () => CircleAvatar(
                                radius: AppSize.s30,
                                child: Transform.scale(
                                  scale: AppSize.s2_5,
                                  child: IconButton(
                                      onPressed: () async {
                                        if (controller.isPlaying.value) {
                                          controller.audioPlayer.pause();
                                          controller.isPlaying(false);
                                        } else {
                                          controller.audioPlayer.play();
                                          controller.isPlaying(true);
                                        }
                                      },
                                      icon: controller.isPlaying.value
                                          ? const Icon(Icons.pause)
                                          : const Icon(
                                              Icons.skip_previous_rounded)),
                                )),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.playSong(
                                    songModelList[controller.playIndex.value+1].uri,
                                    controller.playIndex.value + 1);
                              },
                              icon: const Icon(
                                Icons.skip_next_rounded,
                                size: AppSize.s40,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
