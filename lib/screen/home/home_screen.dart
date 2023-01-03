import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeapi/screen/getclass/lrprovider.dart';
import '../getclass/h_class.dart';
import '../getclass/homeprovider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  TextEditingController f1 = TextEditingController();
  Login login1 = Get.put(Login());
  String data = "";
  User? user;
  Login l2 = Get.put(Login());
  bool isSwitched = false;
  SharedPreferences? logindata;
  String? username;
  bool _isDark = false;
  bool get isDark => _isDark;

  @override
  void initState() {
    super.initState();
    user1();
    initial();
    // themeMode;
    // toggleTheme(false);
    // toggle(true);
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username');
    });
  }

  // void toggle(bool newValue) {
  //   _isDark = newValue;
  //   if (_theme == ThemeMode.light) {
  //     _theme = ThemeMode.dark;
  //   } else {
  //     _theme = ThemeMode.light;
  //   }
  // }
  
  dynamic user1() {
    var firebaseAuth = FirebaseAuth.instance;
    user = firebaseAuth.currentUser;
  }
  
  // ThemeMode _theme = ThemeMode.light;
  // ThemeMode get themeMode => _theme;
  // dynamic toggleTheme(bool isDark) {
  //   _theme = isDark ? ThemeMode.dark : ThemeMode.light;
  // }

  

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
                Get.toNamed('/');
                //Navigator.pushReplacementNamed(context, '/');
                // login1.signOut();
                // login1.cheakUser();
                // Get.offAll(Login_Page());
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Change Theme"),
                  Spacer(),
                  // Switch(
                  //     value: l2.toggleTheme(isSwitched), onChanged: (value) {
                  //       setState(() {
                  //         l2.toggleTheme(value);
                  //       });
                  // }),
                  Switch(
                    value: isSwitched,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                  /*Switch(
                    value: true,
                    onChanged: (value){
                      setState(() {
                       _theme = toggleTheme(true);
                      });
                    },
                  ),*/
                ],
              ),
            ],
          ),
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
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: l1.items!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/second',
                                                arguments: l1.items![index]);
                                          },
                                          child: YoutubePlayer(
                                            controller: YoutubePlayerController(
                                                initialVideoId:
                                                    "${l1.items![index].id}"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ListTile(
                                          leading: Container(
                                            height: 50,
                                            width: 50,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "${l1.items![index].snippet!.thumbnails!.thumbnailsDefault!.url}"),
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${l1.items![index].snippet!.channelTitle}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "${l1.items![index].snippet!.title}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  }),
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
