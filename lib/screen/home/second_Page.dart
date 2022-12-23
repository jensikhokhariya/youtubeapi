import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeapi/screen/provider/homeprovider.dart';

class Second_Page extends StatefulWidget {
  const Second_Page({Key? key}) : super(key: key);

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {

  @override
  Widget build(BuildContext context) {
    Item y1 = ModalRoute.of(context)!.settings.arguments as Item;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, 'home');
          }, icon: Icon(Icons.arrow_back),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 500,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId:
                    "${y1.id}"),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("============${y1.snippet!.publishedAt}================="),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
