import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/config/color.dart';
import 'package:my_beats/controller/song_data_controller.dart';
import 'package:my_beats/controller/song_player_controller.dart';

class SongControllerButton extends StatefulWidget {
  const SongControllerButton({super.key});

  @override
  State<SongControllerButton> createState() => _SongControllerButtonState();
}

class _SongControllerButtonState extends State<SongControllerButton> {
  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${songPlayerController.currentTime} "),
              Obx(
                () => Slider(
                  value: songPlayerController.sliderValue.value
                      .clamp(0.0, songPlayerController.sliderValue.value),
                  onChanged: (value) {
                    songPlayerController.sliderValue.value = value;

                    Duration songPosition = Duration(seconds: value.toInt());
                    songPlayerController.changeSongSlider(songPosition);
                  },
                  min: 0,
                  max: songPlayerController.sliderMaxValue.value,
                  activeColor: Colors.red.shade50,
                  inactiveColor: Color.fromARGB(255, 183, 184, 181),
                ),
              ),
              Text(" ${songPlayerController.totalTime}"),
            ],
          ),
        ),
        Obx(
          () => songPlayerController.isPlaying.value
              ? Container(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        songDataController.playPreviousSong();
                      },
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        songPlayerController.pausePlaying();
                      },
                      child: Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        songDataController.playNextSong();
                      },
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ))
              : Container(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        songDataController.playPreviousSong();
                      },
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        songPlayerController.resumePlaying();
                      },
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        songDataController.playNextSong();
                      },
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                )),
        ),
        SizedBox(height: 20),
        InkWell(
            onTap: () {
              songPlayerController.setLoopSong();
            },
            child: Obx(
              () => Icon(
                Icons.loop,
                color: songPlayerController.isLoop.value
                    ? primaryColor
                    : lableColor,
              ),
            )),
        InkWell(
          onTap: () {
            songPlayerController.playRandomSong();
          },
          child: Obx(() => Icon(
                Icons.shuffle_rounded,
                color: songPlayerController.isSuffeled.value
                    ? primaryColor
                    : lableColor,
              )),
        ),
      ],
    );
  }
}
