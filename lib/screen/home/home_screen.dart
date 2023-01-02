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
  TextEditingController f1 = TextEditingController();
  LProvider hprovider = LProvider();
  String data = "";
  bool login = false;
  SharedPreferences? logindata;
  String? username;

  // String livedata = "";
  // List<Map<String, dynamic>> l2 = [];

  /*int select = 0;
  List sel = [
    Home_Page(),
    Third_Page(),
    Subscribe_Page(),
  ];*/

  // List<Youtube> _MyAllData = [];
  // var snippet = [];
  bool isVisible=false;
  @override
  void initState() {
    super.initState();
    initial();
     // getData();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username');
    });
  }

   // Future<List<Map<String, dynamic>>> getData({String? later}) async {
   //  List<Map<String, dynamic>> l1 = await l2;
   //  setState(() {
   //    l2 = l1;
   //  });
   //  return l1;
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
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
       /* bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          color: Colors.red,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: "Videos",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                label: "Subscribe",
              ),
            ],
            currentIndex: select,
            selectedItemColor: Colors.white,
            onTap: onitem,
            iconSize: 30,
            backgroundColor: Colors.red,
            elevation: 5,
          ),
        ),*/
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
                            Card(
                              elevation: 2,
                              color: Colors.white,
                              shadowColor: Colors.red,
                              child: Container(
                                height: 35,
                                child: TextField(
                                  controller: f1,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isVisible=true;
                                    });
                                  },
                                ),
                              ),
                            ),
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
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "${l1.items![index].snippet!.title}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 10,
                                                    color: Colors.black87),
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

/* _searchbar() {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextField(
//       decoration: InputDecoration(hintText: "Search ..."),
//       onChanged: (text) {
//         text = text.toLowerCase();
//         setState(() {
//           snippet = _MyAllData.where((Snippet) {
//             var idticket = Snippet;
//             return idticket.items!.contains(text);
//           }).toList();
//         });
//       },
//     ),
//   );
 }*/

 // void search(String later) async {
 //    List<Map<String, dynamic>> data = await getData();
 //    List<Map<String, dynamic>> filterdata = [];
 //
 //    for (int i = 0; i < data.length; i++) {
 //      if (data[i]['snippet']
 //          .toString()
 //          .toLowerCase()
 //          .contains(later.toLowerCase())) {
 //        filterdata.add(data[i]);
 //        setState(() {
 //          l2 = filterdata;
 //        });
 //      }
 //    }
 //   }

 /* void onitem(int index) {
    setState(() {
      select = index;
    });
  }*/
}
