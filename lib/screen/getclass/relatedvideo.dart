import 'dart:convert';
import 'package:get/get.dart';
import 'package:youtubeapi/screen/getclass/reviprovider.dart';

class YoutubeData1 {
  String link =
      "https://youtube.googleapis.com/youtube/v3/search?part=snippet&regionCode=IN&relatedToVideoId=7lCDEYXw3mM&type=video&key=AIzaSyCAw6PmSZ8cYwiX5WA_hzpuDTOOe8d05EM";

  Future<Response<Related>> getData1(v1) async => await v1;
}

abstract class HomeProvider extends GetConnect implements YoutubeData1 {
  @override
  Future<Related> onInit()async {
    httpClient.defaultDecoder = (val) => Related().fromjson(val as Map<String, dynamic>);
    Uri uri = Uri.parse(link);
    var res = await get("$uri");
    var v1 = jsonDecode(res.body);
    print("object : ${jsonEncode(v1)}");
    return Related.fromJson(v1);
  }
  @override
  Future<Response<Related>> getData1(v1) => get(v1);
}
