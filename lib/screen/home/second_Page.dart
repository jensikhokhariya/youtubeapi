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
          backgroundColor: Colors.red,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 500,
                padding: EdgeInsets.all(10),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(initialVideoId: "${y1.id}"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${y1.statistics!.likeCount}"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${y1.statistics!.favoriteCount}"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.comment,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${y1.statistics!.commentCount}"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'fourth');
                        },
                        icon: Icon(
                          Icons.subscriptions_outlined,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("subscribe"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "${y1.snippet!.description}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
