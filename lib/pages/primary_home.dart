import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_beats/components/sidebar_btn.dart';
import 'package:my_beats/components/song_header.dart';
import 'package:my_beats/pages/home.dart';
import 'package:my_beats/pages/side_menu.dart';

class PrimaryHome extends StatefulWidget {
  const PrimaryHome({super.key});

  @override
  State<PrimaryHome> createState() => _PrimaryHomeState();
}

class _PrimaryHomeState extends State<PrimaryHome>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: !isSideBarOpen ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 288, 0),
              child: Transform.scale(
                  scale: scalAnimation.value,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Home())),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: isSideBarOpen ? 220 : 0,
            curve: Curves.fastOutSlowIn,
            top: 16,
            child: SideBarBtn(
              isSideBarOpen: isSideBarOpen,
              onToggleCallback: () {
                setState(() {
                  isSideBarOpen = !isSideBarOpen;
                  if (isSideBarOpen) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
