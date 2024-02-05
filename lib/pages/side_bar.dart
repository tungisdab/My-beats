import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_beats/config/theme.dart';
import 'package:my_beats/pages/home.dart';
import 'package:my_beats/pages/side_menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  bool isSideMenuClose = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Positioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(),
          ),
          Transform.translate(
            offset: Offset(288, 0),
            child: Transform.scale(
              scale: 0.9, 
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Home()
              )),
          )
        ],
      ),
    );
  }
}
