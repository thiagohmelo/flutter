import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/Video.dart';

const API_KEY = "AIzaSyBigH4eJzjblaO8YJF3e2wyXLRTfCS-XpM";
/* ******************
https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken
*************** */
class Api {
  search(String search) async{
    http.Response response = await http.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    decode(response);
  }

  List<Video> decode(http.Response response){
    if(response.statusCode == 200){
      var decode = json.decode(response.body);
      List<Video> videos = decode["items"].map<Video>((map)=> Video.fromJson(map)).toList();
      return videos;
    } else {
      throw Exception("Failed to load videos");
    }
  }

}