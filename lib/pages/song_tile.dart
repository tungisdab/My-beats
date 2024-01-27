import 'package:flutter/material.dart';

class SongTile extends StatefulWidget {
  final String songName;
  final VoidCallback onPress;
  const SongTile({super.key, required this.songName, required this.onPress});

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  @override
  Widget build(BuildContext context) {
    final songName = widget.songName;
    final onPress = widget.onPress;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(
                    Icons.music_note,
                    color: Colors.white,
                  ),
                  Flexible(
                    child: Text(
                      "$songName",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}