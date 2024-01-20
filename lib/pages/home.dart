import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/components/song_header.dart';
import 'package:my_beats/components/trending_song_slider.dart';
import 'package:my_beats/config/color.dart';
import 'package:my_beats/controller/song_data_controller.dart';
import 'package:my_beats/pages/song_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
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
                  InkWell(
                    onTap: (){
                      // songDataController.getLocalSongs();
                      songDataController.isDeviceSong.value = false;
                    },
                    child: Text(
                      "Cloud Song",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: songDataController.isDeviceSong.value ? lableColor : primaryColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      songDataController.isDeviceSong.value = true;
                    },
                    child: Text(
                      "Device Song",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: songDataController.isDeviceSong.value ? primaryColor : lableColor,
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 20),
              // SongTile(),
              // SizedBox(height: 20),
              // SongTile(),
              // SizedBox(height: 20),
              // SongTile(),
              // SizedBox(height: 20),
              // SongTile(),
              // SizedBox(height: 20),
              // SongTile(),
              // SizedBox(height: 20),
              // SongTile(),
              Obx(() => songDataController.isDeviceSong.value 
                ? Column(
                  children: songDataController.localSongList.value.map((e) => SongTile()).toList()
                ) : Column(
                  children: [
                    SizedBox(height: 20),
                    SongTile(),
                    SizedBox(height: 20),
                    SongTile(),
                    SizedBox(height: 20),
                    SongTile(),
                    SizedBox(height: 20),
                    SongTile(),
                    SizedBox(height: 20),
                    SongTile(),
                    SizedBox(height: 20),
                    SongTile(),
                  ],
                ))
            ],
          ),
        ),
      )
    );
  }
}