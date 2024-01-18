import 'package:flutter/material.dart';
import 'package:my_beats/components/song_and_volume.dart';
import 'package:my_beats/components/song_header_button.dart';

class PlaySongPage extends StatefulWidget {
  const PlaySongPage({super.key});

  @override
  State<PlaySongPage> createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          SongHeaderButton(),
          SizedBox(height: 20),
          SongAndVolume()
        ],
      ),
    );
  }
}