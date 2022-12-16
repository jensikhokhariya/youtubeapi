import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/screen/provider/homeprovider.dart';

class YoutubeData {
  Future<YouTube> getData(String name) async {
    String link = "https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=AIzaSyCAw6PmSZ8cYwiX5WA_hzpuDTOOe8d05EM&fields=items(id,snippet(channelId,title,categoryId),statistics)&part=snippet,statistics";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var v1 = jsonDecode(res.body);
    print("object : $v1");
    return YouTube().youTubeFactory(v1);
  }
}
