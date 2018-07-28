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

    var list = List<Photo>();
    _list.forEach((item) {
      var _item = item["photo"];
      var photo = Photo(
        id: _item["id"],
        url: _item["url"],
        subject: _item["subject"],
        sq150_url: _item["sq150_url"],
        sq300_url: _item["sq300_url"],
        does_like: _item["does_like"],
        liked: _item["liked"],
        is_owner: _item["is_owner"],
        viewable: _item["viewable"],
      );
      list.add(photo);
    });

    return list;
  }

  void a() {}
}
