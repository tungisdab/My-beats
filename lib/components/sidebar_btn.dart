import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarBtn extends StatefulWidget {
  final bool isSideBarOpen;
  final Function() onToggleCallback;
  const SideBarBtn(
      {super.key, required this.isSideBarOpen, required this.onToggleCallback});
  @override
  State<SideBarBtn> createState() => _SideBarBtnState();
}

class _SideBarBtnState extends State<SideBarBtn> {
  @override
  Widget build(BuildContext context) {
    bool isSideBarOpen = widget.isSideBarOpen;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 19.0, left: 10),
        child: InkWell(
          onTap: () {
            widget.onToggleCallback();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.shade100,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  )
                ]
                ),
            child: Icon(
              !isSideBarOpen ? Icons.dehaze_outlined : Icons.close_rounded,
              // Icons.dehaze_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
