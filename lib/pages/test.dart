import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/controller/cloud_song_controller.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            cloudSongController.uploadSongToDB();
          },
          child: Text(
            "call db",
          ),
        ),
      ),
    );
  }
}