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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'third');
              },
              icon: Icon(Icons.arrow_forward_outlined),
            ),
          ],
        ),
        body: Column(
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: y1.snippet!.channelId!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          padding: EdgeInsets.all(10),
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                                initialVideoId:
                                    "${y1.snippet!.channelId![index]}"),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: y1.snippet!.channelId!.length,
            //       itemBuilder: (context, index) {
            //         return Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               height: 100,
            //               width: 150,
            //               padding: EdgeInsets.all(10),
            //               child: GestureDetector(
            //                 onTap: () {
            //                   Navigator.pushReplacementNamed(context, 'third',
            //                       arguments: y1.snippet!.channelId![index]);
            //                 },
            //                 child: YoutubePlayer(
            //                   controller: YoutubePlayerController(
            //                       initialVideoId:
            //                           "${y1.snippet!.channelId![index]}"),
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Expanded(
            //               child: Text("${y1.snippet!.title}"),
            //             ),
            //           ],
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
