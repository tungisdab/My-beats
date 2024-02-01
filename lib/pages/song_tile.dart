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
      padding: const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 188, 130, 217),
                Color(0xFFF8CDDA),
                Color.fromARGB(255, 103, 130, 239),
              ],
            ) 
          ),
          height: 45,
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              SizedBox(width: 10,),
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
      ),
    );
  }
}