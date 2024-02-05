import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFF8CDDA),
                    Color.fromARGB(255, 103, 130, 239),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 1)
                ]),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFF8CDDA),
                  Color.fromARGB(255, 103, 130, 239),
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    spreadRadius: 1)
              ]),
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
