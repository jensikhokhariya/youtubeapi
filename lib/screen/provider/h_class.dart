import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/screen/provider/homeprovider.dart';

class YoutubeData {
  Future<Youtube> getData() async {
    String link =
        "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&regionCode=IN&maxResults=10&key=AIzaSyCAw6PmSZ8cYwiX5WA_hzpuDTOOe8d05EM&videoCategoryId=28";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var v1 = jsonDecode(res.body);
    print("object : ${jsonEncode(v1)}");
    return Youtube.fromJson(v1);
  }
}

//"https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=AIzaSyCAw6PmSZ8cYwiX5WA_hzpuDTOOe8d05EM&fields=items(id,snippet(channelId,title,categoryId),statistics)&part=snippet,statistics"
