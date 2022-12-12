import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/screen/provider/homeprovider.dart';

class YoutubeData {
  Future<YouTube> getData(String name)async {
    String link = "https://www.googleapis.com/youtube/v3/videos";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var v1 = jsonDecode(res.body);

    return YouTube().youTubeFactory(v1);
  }
}