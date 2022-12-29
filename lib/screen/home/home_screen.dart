import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
  bool login = false;
  SharedPreferences? logindata;
  String? username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("YouTube"),
          actions: [
            IconButton(
              onPressed: () {
                logindata?.setBool('login', true);
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: l1.items!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
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
                                      SizedBox(height: 10,),
                                      ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage("${l1.items![index].snippet!.thumbnails!.thumbnailsDefault!.url}"),
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${l1.items![index].snippet!
                                                  .channelTitle}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "${l1.items![index].snippet!
                                                  .title}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10,),
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
