import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeapi/screen/getclass/relatedvideo.dart';
import 'package:youtubeapi/screen/getclass/reviprovider.dart';
import 'package:youtubeapi/screen/home/second_Page.dart';

class Third_Page extends StatefulWidget {
  const Third_Page({Key? key}) : super(key: key);

  @override
  State<Third_Page> createState() => _Third_PageState();
}

class _Third_PageState extends State<Third_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("videos list"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Related>(
                    future: YoutubeData1().getData1(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        Related l1 = snapshot.data;
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: l1.items!.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed('/fourth',arguments: l1.items![index]);
                                          Get.offAll(Second_Page());
                                          // Navigator.pushReplacementNamed(context, 'fourth',arguments: l1.items![index]);
                                          // Get.toNamed('/fourth',
                                          //     arguments: l1.items![index]);
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 150,
                                          padding: EdgeInsets.all(10),
                                          child: YoutubePlayer(
                                            controller: YoutubePlayerController(
                                                initialVideoId:
                                                    "${l1.items![index].id!.videoId}"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                          child: Text(
                                              "${l1.items![index].snippet!.title}")),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
