import 'package:cure/model/photo.dart';
import 'package:flutter/material.dart';

/// 图片详情页
class PhotoPage extends StatefulWidget {
  PhotoPage(this.photo) : assert(photo != null);

  final Photo photo;

  static void launch(BuildContext context, Photo photo) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoPage(photo)));
  }

  @override
  createState() => PhotoPageState();
}

class PhotoPageState extends State<PhotoPage> {
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
    return Center(
      child: Text("test"),
    );
  }
}
