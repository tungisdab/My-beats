import 'dart:ui';

import 'package:flutter/material.dart';

class SongHeader extends StatefulWidget {
  const SongHeader({super.key});

  @override
  State<SongHeader> createState() => _SongHeaderState();
}

class _SongHeaderState extends State<SongHeader> {
  final gradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
    Colors.blue,
    Colors.red,
  ]);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.09,
            // height : MediaQuery.of(context).size.width * 0.09,
            width: 40,
            height: 40,
            child: Image.asset("assets/icons/music-note.png", fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        ShaderMask(
          shaderCallback: (bounds) {
            return gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            'K.mas!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
             
            ),
          ),
        ),
        
      ],
    );
  }
}
