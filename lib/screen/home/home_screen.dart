import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:youtubeapi/screen/provider/lrprovider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  TextEditingController texturl = TextEditingController();
  String url = "https://www.youtube.com/";
  InAppWebViewController? inAppWebViewController;
  double progress = 0;
  LProvider hprovider = LProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (inAppWebViewController != null) {
                          inAppWebViewController!.goBack();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (inAppWebViewController != null) {
                          inAppWebViewController!.reload();
                        }
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              title: TextField(
                controller: texturl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        hprovider.signOut();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(url),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
                ),
                onWebViewCreated: (controller){
                  setState((){
                    inAppWebViewController = controller;
                  });
                },
                onLoadStart: (controller,url){
                  setState((){
                    this.url=url.toString();
                    texturl.text=this.url;
                  });
                },
                onLoadStop: (controller,url){
                  setState((){
                    this.url=url.toString();
                    texturl.text=this.url;
                  });
                },
                onProgressChanged: (controller,ps){
                  setState((){
                    setState((){
                      progress=ps/100;
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:youtubeapi/screen/provider/h_class.dart';
// import 'package:youtubeapi/screen/provider/homeprovider.dart';
// import '../provider/lrprovider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class Home_Page extends StatefulWidget {
//   const Home_Page({Key? key}) : super(key: key);
//
//   @override
//   State<Home_Page> createState() => _Home_PageState();
// }
//
// class _Home_PageState extends State<Home_Page> {
//   LProvider hprovider = LProvider();
//   String data = "";
//   bool login = false;
//   WebViewWidget? webViewWidget;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 hprovider.signOut();
//                 Navigator.pushReplacementNamed(context, '/');
//               },
//               icon: Icon(
//                 Icons.logout_rounded,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Column(
//             children: [
//               Expanded(
//                 child: FutureBuilder<YouTube>(
//                     future: YoutubeData().getData(data),
//                     builder: (context, AsyncSnapshot snapshot) {
//                       if (snapshot.hasError) {
//                         return Center(child: Text("${snapshot.error}"));
//                       } else if (snapshot.hasData) {
//                         YouTube l1 = snapshot.data;
//                         return Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ListView.builder(
//                                   itemCount: l1.video!.length,
//                                   itemBuilder: (context, index) {
//                                     return Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("${l1.video![index].id}"),
//                                         //https://www.googleapis.com/youtube/v3/
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                             "${l1.video![index].snippet!.channelId}"),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                             "${l1.video![index].snippet!.title}"),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                                 "${l1.video![index].statistics!.viewCount}"),
//                                             Text(
//                                                 "${l1.video![index].statistics!.likeCount}"),
//                                             Text(
//                                                 "${l1.video![index].snippet!.categoryId}"),
//                                             Text(
//                                                 "${l1.video![index].statistics!.favoriteCount}"),
//                                             Text(
//                                                 "${l1.video![index].statistics!.commentCount}"),
//                                           ],
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }
//                       return Center(child: CircularProgressIndicator());
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // child: login == false ? Login_Page() : Home_Page(),
