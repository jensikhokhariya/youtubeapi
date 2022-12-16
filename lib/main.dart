import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/home/Register_screen.dart';
import 'package:youtubeapi/screen/home/login_screen.dart';
import 'package:youtubeapi/screen/provider/lrprovider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          '/':(context)=> Login_Page(),
          'res':(context)=> Register_Page(),
          'home':(context)=> Home_Page(),
        },
      ),
    ),
  );
}
