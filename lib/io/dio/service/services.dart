import 'dart:async';

import 'package:cure/common/dart.dart';
import 'package:cure/model/photo.dart';
import 'package:dio/dio.dart';

class BaseService {
  Dio dio;

  BaseService(this.dio);
}

class PhotoService extends BaseService {
  PhotoService(Dio dio) : super(dio);

  Future<List<Photo>> getPhotos(int page) async {
    var response = await dio.get(
      '/api/photo/popular.json',
      data: {
        'page': page,
        'limit': Constant.pageSize,
//        'p3_photo_list': true,
//        'photo_context': 'popular_feed',
      },
    );
    var data = response.data;
    var _list = data['list'];

    var list = List<Photo>();
    _list.forEach((item) {
      var _item = item['photo'];
      var photo = Photo(
        id: _item['id'],
        url: _item['url'],
        subject: _item['subject'],
        sq150_url: _item['sq150_url'],
        sq300_url: _item['sq300_url'],
        large_url: _item['large_url'],
//        does_like: _item["does_like"],
//        liked: _item["liked"],
//        is_owner: _item["is_owner"],
//        viewable: _item["viewable"],
      );
      list.add(photo);
    });

    return list;
  }
}
