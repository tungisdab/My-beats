import 'dart:ui';

import 'package:flutter/material.dart';

class SongHeader extends StatefulWidget {
  const SongHeader({super.key});

  @override
  State<SongHeader> createState() => _SongHeaderState();
}

class _SongHeaderState extends State<SongHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            child: Image.asset("assets/images/ig.png", fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        Text(
          "MUSIC BAG",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"
          ),
        )
      ],
    );
  }
}