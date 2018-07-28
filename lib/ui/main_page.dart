import 'package:cure/io/rest/photo_service.dart';
import 'package:cure/model/photo.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final _populars = <Photo>[];

  @override
  void initState() {
    super.initState();
    refreshData();
  }

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

  void refreshData() {
    PhotoService.getPhotos().then((list) {
      setState(() {
        _populars.addAll(list);
      });
    });
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
      title: Text("Test title3"),
    );
  }
}
