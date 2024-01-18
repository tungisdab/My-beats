import 'package:flutter/material.dart';
import 'package:my_beats/pages/play_song_page.dart';

class SongTile extends StatefulWidget {
  const SongTile({super.key});

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaySongPage(), // Thay ReadPdf() bằng trang bạn muốn điều hướng đến
          ),
        );
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber
        ),
        child: Row(
          children: [
            SizedBox(width: 15,),
            Icon(
              Icons.music_note,
              color: Colors.white,
            ),
            Text(
              "Say my name",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}