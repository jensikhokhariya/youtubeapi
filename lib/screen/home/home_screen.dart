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
                    }else if (snapshot.hasData){
                      YouTube l1 = snapshot.data;
                      return Padding(padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListView.builder(itemCount: l1.videos!.length,itemBuilder:(context,index){
                              return Column(
                                children: [
                                  Text("${l1.videos![index].id}"),
                                  Text("${l1.videos![index].chanelId}"),
                                ],
                              );
                            })
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// else if (snapshot.hasData) {
// Status s1 = snapshot.data;
// return Padding(
// padding: const EdgeInsets.all(8),
// child: Column(
// children: [
// Stack(
// children: [
// Container(
// height: 200,
// width: double.infinity,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: Image.network(
// "${s1.article![0].urltoimage}",
// fit: BoxFit.cover,
// height: 300,
// width: 100,
// ),
// ),
// ),
// Container(
// height: 200,
// width: double.infinity,
// padding: EdgeInsets.only(right: 10,left: 10,bottom: 5),
// alignment: Alignment.bottomCenter,
// child: Text("${s1.article![0].title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
// ),
// ],
// ),
// Expanded(
// child: ListView.builder(
// itemBuilder: (context, index) {
// return Card(
// shadowColor: Colors.pink,
// elevation: 30,
// child: GestureDetector(
// onTap: () {
// Navigator.pushNamed(context, 'new',
// arguments: s1.article![index]);
// },
// child: ListTile(
// title:
// Text("${s1.article![index].title}"),
// subtitle: Text(
// "${s1.article![index].author}"),
// trailing: ClipRRect(
// borderRadius:
// BorderRadius.circular(10),
// child: Image.network(
// "${s1.article![index].urltoimage}",
// fit: BoxFit.cover,
// height: 300,
// width: 100,
// ),
// ),
// ),
// ),
// );
// },
