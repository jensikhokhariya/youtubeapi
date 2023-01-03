import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeapi/screen/home/thirdpage.dart';
import '../getclass/reviprovider.dart';

class Fourth_Page extends StatefulWidget {
  const Fourth_Page({Key? key}) : super(key: key);

  @override
  State<Fourth_Page> createState() => _Fourth_PageState();
}

class _Fourth_PageState extends State<Fourth_Page> {
  @override
  Widget build(BuildContext context) {
    Items t1 = ModalRoute.of(context)!.settings.arguments as Items;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            onPressed: () {
              Get.to(Third_Page());
              // Navigator.pushReplacementNamed(context, 'third');
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 500,
              padding: EdgeInsets.all(10),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: "${t1.id!.videoId}"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${t1.snippet!.title}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "${t1.snippet!.thumbnails!.thumbnailsDefault!.url}"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${t1.snippet!.channelTitle}",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 19),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Text(
                "${t1.snippet!.description}",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
