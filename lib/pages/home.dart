import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/components/song_header.dart';
import 'package:my_beats/components/trending_song_slider.dart';
import 'package:my_beats/controller/cloud_song_controller.dart';
import 'package:my_beats/controller/song_data_controller.dart';
import 'package:my_beats/controller/song_player_controller.dart';
import 'package:my_beats/pages/play_song_page.dart';
import 'package:my_beats/pages/song_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SongHeader(),
            SizedBox(height: 20),
            TrendingSongSlider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFF8CDDA),
                          Color.fromARGB(255, 103, 130, 239),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // songDataController.getLocalSongs();
                        songDataController.isDeviceSong.value = false;
                      },
                      child: Text(
                        "Cloud Song",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: songDataController.isDeviceSong.value
                                ? Colors.black
                                : Colors.deepPurpleAccent,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),

                // InkWell(
                //   onTap: () async {
                //     songDataController.isDeviceSong.value = true;
                //     await songDataController.storagePermission();
                //   },
                //   child: Text(
                //     "Device Song",
                //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
                //       color: songDataController.isDeviceSong.value
                //           ? primaryColor
                //           : lableColor,
                //     ),
                //   ),
                // ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFF8CDDA),
                          Color.fromARGB(255, 103, 130, 239),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        songDataController.isDeviceSong.value = true;
                        await songDataController.checkAndRequestPermissions(
                            retry: true);
                        await songDataController.getLocalSongs();
                      },
                      child: Text(
                        "Device Song",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: songDataController.isDeviceSong.value
                                ? Colors.deepPurpleAccent
                                : Colors.deepPurpleAccent,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => songDataController.isDeviceSong.value
                ? Column(
                    children: songDataController.localSongList.value
                        .map((e) => SongTile(
                              songName: e.title,
                              onPress: () {
                                songPlayerController.playLocalAudio(e);
                                songDataController
                                    .findCurrentSongPlayingIndex(e.id);
                                Get.to(PlaySongPage());
                              },
                            ))
                        .toList())
                : Column(
                    children: cloudSongController.cloudSongList.value
                        .map((e) => SongTile(
                              onPress: () {
                                songPlayerController.playCloudAudio(e);
                                songDataController
                                    .findCurrentSongPlayingIndex(e.id!);
                                Get.to(PlaySongPage());
                              },
                              songName: e.title!,
                            ))
                        .toList(),
                  )),
          ],
        ),
      ),
    ));
  }
}
