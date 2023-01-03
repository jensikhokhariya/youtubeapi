import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtubeapi/screen/home/bottempage.dart';
import 'package:youtubeapi/screen/home/fourthpage.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/home/register_screen.dart';
import 'package:youtubeapi/screen/home/login_screen.dart';
import 'package:youtubeapi/screen/home/second_Page.dart';
import 'package:youtubeapi/screen/home/subscribepage.dart';
import 'package:youtubeapi/screen/home/thirdpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/bottem',
      routes: {
        '/': (context) => Login_Page(),
        '/res': (context) => Register_Page(),
        '/home': (context) => Home_Page(),
        '/second': (context) => Second_Page(),
        '/third': (context) => Third_Page(),
        '/fourth': (context) => Fourth_Page(),
        '/subscribe': (context) => Subscribe_Page(),
        '/bottem': (context) => Bottem(),
      },
    ),
  );
}
