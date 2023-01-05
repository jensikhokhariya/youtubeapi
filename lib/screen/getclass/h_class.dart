import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:youtubeapi/screen/getclass/homeprovider.dart';

 class YoutubeData extends GetxController {
   Future<dynamic> link =
       "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&maxResults=5&regionCode=IN&key=AIzaSyCAw6PmSZ8cYwiX5WA_hzpuDTOOe8d05EM" as Future<dynamic>;
  Future<Response<Youtube>> getData(link) async => await link;

}

abstract class HomeProvider extends GetConnect implements YoutubeData {
   @override
  Future<Youtube> onInit()async {
    httpClient.defaultDecoder = (val) => Youtube().fromjson(val as Map<String, dynamic>);
    Uri uri = Uri.parse(link.toString());
    var res = await http.get(uri);
    var v1 = jsonDecode(res.body);
    print("object : ${jsonEncode(v1)}");
    return Youtube.fromJson(v1);
  }
  @override
  Future<Response<Youtube>> getData(link) => get(link.toString());
}
