import 'package:flutter/material.dart';
import 'package:my_beats/components/song_header.dart';
import 'package:my_beats/components/trending_song_slider.dart';
import 'package:my_beats/pages/song_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                  Text(
                    "Cloud Song",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Device Song",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SongTile(),
            ],
          ),
        ),
      )
    );
  }
}