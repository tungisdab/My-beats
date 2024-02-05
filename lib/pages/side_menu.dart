import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
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
          child: Column(
            children: [
              SizedBox(height: 30),
              
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Divider(
                  color: Colors.white,
                  height: 1,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Home", style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.music_note, color: Colors.white,),
                title: Text("Songs", style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.album, color: Colors.white,),
                title: Text("Albums", style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text("Artists", style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white,),
                title: Text("Settings", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
      ),
    );
  }
}
