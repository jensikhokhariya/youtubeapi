import 'package:flutter/material.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/home/thirdpage.dart';

class Bottem extends StatefulWidget {
  const Bottem({Key? key}) : super(key: key);

  @override
  State<Bottem> createState() => _BottemState();
}

class _BottemState extends State<Bottem> {
  int select = 0;
  List sel = [
    Home_Page(),
    Third_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: sel[select],
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          color: Colors.red,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: "Videos",
              ),
            ],
            currentIndex: select,
            selectedItemColor: Colors.white,
            onTap: onitem,
            iconSize: 30,
            backgroundColor: Colors.red,
            elevation: 5,
          ),
        ),
      ),
    );
  }

  void onitem(int index) {
    setState(() {
      select = index;
    });
  }
}
