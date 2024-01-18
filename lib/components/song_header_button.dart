import 'package:flutter/material.dart';

class SongHeaderButton extends StatefulWidget {
  const SongHeaderButton({super.key});

  @override
  State<SongHeaderButton> createState() => _SongHeaderButtonState();
}

class _SongHeaderButtonState extends State<SongHeaderButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber
          ),
          child: Center(
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}