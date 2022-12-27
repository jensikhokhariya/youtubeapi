import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeapi/screen/provider/h_class.dart';
import 'package:youtubeapi/screen/provider/homeprovider.dart';

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
          title: Text("videos"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Youtube>(
                    future: YoutubeData().getData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        Youtube l1 = snapshot.data;
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: l1.items!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 150,
                                            padding: EdgeInsets.all(10),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.pushReplacementNamed(
                                                    context, 'second',
                                                    arguments: l1.items![index]);
                                              },
                                              child: YoutubePlayer(
                                                controller: YoutubePlayerController(
                                                    initialVideoId:
                                                    "${l1.items![index].id}"),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Text("${l1.items![index].snippet!.title}"),),
                                        ],
                                      ),
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
