import 'package:flutter/material.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/home/second_Page.dart';

class Bottem extends StatefulWidget {
  const Bottem({Key? key}) : super(key: key);

  @override
  State<Bottem> createState() => _BottemState();
}

class _BottemState extends State<Bottem> {
  int select = 0;
  List sel = [
    Home_Page(),
    Second_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                icon: Icon(Icons.sentiment_satisfied),
                label: "Smile",
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
        body: sel[select],
      ),
    );
  }

  void onitem(int index) {
    setState(() {
      select = index;
    });
  }
}
