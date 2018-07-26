import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final _populars = <Photo>[];

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
    return ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        return _buildRow(_populars[i]);
      },
      itemCount: _populars.length,
    );
  }

  /// 创建每一项
  Widget _buildRow(Photo photo) {
    return ListTile(
      title: Text("Test title"),
    );
  }
}

class Wrap<T> {
  T t;
}

class Photo {
/*  {
  photo: {
  id: 6551257,
  url: "/photo/6551257",
  subject: "双黒",
  sq150_url: "https://wc-ahba9see.c.sakurastorage.jp/469922/rjprqluawpxfuotgrjxldhmathkvhedofjwgnvoe-350x600.jpg",
  sq300_url: "https://wc-ahba9see.c.sakurastorage.jp/469922/rjprqluawpxfuotgrjxldhmathkvhedofjwgnvoe-350x600.jpg",
  does_like: false,
  liked: false,
  is_owner: false,
  viewable: true
  }
  }*/

  final int id;
  final String url;
  final String subject;
  final String sq150_url;
  final String sq300_url;
  final bool does_like;
  final bool liked;
  final bool is_owner;
  final bool viewable;
}
