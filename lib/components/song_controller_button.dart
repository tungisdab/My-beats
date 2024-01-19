import 'package:flutter/material.dart';

class SongControllerButton extends StatefulWidget {
  const SongControllerButton({super.key});

  @override
  State<SongControllerButton> createState() => _SongControllerButtonState();
}

class _SongControllerButtonState extends State<SongControllerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 40,
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 40,
          ),
          Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 40,
          ),
        ],
      )
    );
  }
}