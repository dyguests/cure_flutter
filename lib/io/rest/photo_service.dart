import 'dart:async';
import 'dart:convert';

import 'package:cure/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  static Future<List<Photo>> getPhotos() async {
    var response = await http.get('https://worldcosplay.net/api/photo/popular.json?limit=16&p3_photo_list=true&page=1&photo_context=popular_feed');
    var map = json.decode(response.body);
    List<PhotoWrap> listWrap = map["list"];
    var list = listWrap.map((photoWrap) => photoWrap.photo);
    return list;
  }
}
