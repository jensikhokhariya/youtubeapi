import 'package:flutter/material.dart';

class Subscribe_Page extends StatefulWidget {
  const Subscribe_Page({Key? key}) : super(key: key);

  @override
  State<Subscribe_Page> createState() => _Subscribe_PageState();
}

class _Subscribe_PageState extends State<Subscribe_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Subscribe videos"),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
