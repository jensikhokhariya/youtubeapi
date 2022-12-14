import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/home/Register_screen.dart';
import 'package:youtubeapi/screen/home/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> Login_Page(),
        'res':(context)=> Register_Page(),
        'home':(context)=> Home_Page(),
      },
    ),
  );
}
