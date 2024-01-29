import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/components/song_and_volume.dart';
import 'package:my_beats/components/song_controller_button.dart';
import 'package:my_beats/components/song_header_button.dart';
import 'package:my_beats/controller/song_player_controller.dart';

class PlaySongPage extends StatefulWidget {
  const PlaySongPage({super.key});

  @override
  State<PlaySongPage> createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            SongHeaderButton(),
            SizedBox(height: 20),
            SongAndVolume(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My list",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(
                  Icons.playlist_add_check_circle_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Obx(
                    () => Text(
                      "${songPlayerController.songTitle.value}",
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 25),
                    ),
                  )),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.play_circle_outline,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
                child: Obx(
              () => Text(
                "${songPlayerController.songArtist.value}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 25, color: Colors.red),
              ),
            )),
            
            SongControllerButton(),
            
          ],
        ),
      ),
    );
  }
}
