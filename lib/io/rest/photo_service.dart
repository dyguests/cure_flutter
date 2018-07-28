import 'dart:async';
import 'dart:convert';

import 'package:cure/model/photo.dart';
import 'package:http/http.dart' as http;
//import 'package:dio';

class PhotoService {
  static Future<List<Photo>> getPhotos() async {
    var response = await http.get('https://worldcosplay.net/api/photo/popular.json?limit=16&p3_photo_list=true&page=1&photo_context=popular_feed');
    var responseBody = json.decode(response.body);
//    var map2 = map["list"][0];
//    List<PhotoWrap> listWrap = map["list"];
//    var list = listWrap.map((photoWrap) => photoWrap.photo);

    var _list = responseBody["list"] as List;
    var list = _list.map((item) {
      var _item = item["photo"];
      return Photo(id: _item["id"]);
    });

    return list;
  }

  void a() {}
}
