import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/screen/provider/h1_provider.dart';

class YoutubeData1{
  Future<Youtube1> getData1() async {
    String link =
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&relatedToVideoId=7lCDEYXw3mM&type=video&key=AIzaSyCAw6PmSZ8cYwiX5WA_hzpuDTOOe8d05EM";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var v1 = jsonDecode(res.body);
    print("object : ${jsonEncode(v1)}");
    return Youtube1.fromJson(v1);
  }
}