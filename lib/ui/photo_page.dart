import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// 图片详情页
class PhotoPage extends StatefulWidget {
  final Photo photo;

  PhotoPage(this.photo) : assert(photo != null);

  static void launch(BuildContext context, Photo photo) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoPage(photo)));
  }

  @override
  createState() => PhotoPageState(photo);
}

class PhotoPageState extends State<PhotoPage> {
  final Photo photo;

  PhotoPageState(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cure'),
//        actions: <Widget>[IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: PhotoView(
        imageProvider: new NetworkImage('https://wc-ahba9see.c.sakurastorage.jp/179162/qbdrujivtvpqdpcpeoumcqmtaipbnexphcvzmhzh-3000.jpg'),
        minScale: 0.25,
        maxScale: 4.0,
      ),
    );
  }
}
