import 'package:flutter/material.dart';
import 'package:youtubeapi/screen/provider/h_class.dart';
import 'package:youtubeapi/screen/provider/homeprovider.dart';
import '../provider/lrprovider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  LProvider hprovider = LProvider();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                hprovider.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(Icons.logout_rounded))
        ]),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<YouTube>(
                    future: YoutubeData().getData(data),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        YouTube l1 = snapshot.data;
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: l1.videos!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${l1.videos![index].id}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("${l1.videos![index].chanelId}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("${l1.videos![index].categoryId}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("${l1.videos![index].title}"),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("${l1.videos![index].viewCount}"),
                                              Text("${l1.videos![index].likeCount}"),
                                              Text("${l1.videos![index].dislikeCount}"),
                                              Text("${l1.videos![index].favoriteCount}"),
                                              Text("${l1.videos![index].commentCount}"),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
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