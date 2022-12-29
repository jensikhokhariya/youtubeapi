import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeapi/screen/provider/relatedvideo.dart';
import 'package:youtubeapi/screen/provider/reviprovider.dart';

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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pushReplacementNamed(context, 'fourth',arguments: l1.items![index]);
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
                                      SizedBox(height: 5,),
                                      Expanded(child: Text("${l1.items![index].snippet!.title}")),
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
        // Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: FutureBuilder<Youtube>(
        //             future: YoutubeData().getData(),
        //             builder: (context, AsyncSnapshot snapshot) {
        //               if (snapshot.hasError) {
        //                 return Center(child: Text("${snapshot.error}"));
        //               } else if (snapshot.hasData) {
        //                 Youtube l1 = snapshot.data;
        //                 return Column(
        //                   children: [
        //                     Expanded(
        //                       child: ListView.builder(
        //                         itemCount: l1.items!.length,
        //                         itemBuilder: (context, index) {
        //                           return Column(
        //                             children: [
        //                               Row(
        //                                 children: [
        //                                   Container(
        //                                     height: 100,
        //                                     width: 150,
        //                                     padding: EdgeInsets.all(10),
        //                                     child: GestureDetector(
        //                                       onTap: (){
        //                                         Navigator.pushReplacementNamed(
        //                                             context, 'second',
        //                                             arguments: l1.items![index]);
        //                                       },
        //                                       child: YoutubePlayer(
        //                                         controller: YoutubePlayerController(
        //                                             initialVideoId:
        //                                             "${l1.items![index].id}"),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   Expanded(child: Text("${l1.items![index].snippet!.title}"),),
        //                                 ],
        //                               ),
        //                             ],
        //                           );
        //                         },
        //                       ),
        //                     ),
        //                   ],
        //                 );
        //               }
        //               return Center(child: CircularProgressIndicator());
        //             }),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
