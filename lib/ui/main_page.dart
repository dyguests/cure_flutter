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
    return GridView.builder(
      padding: EdgeInsets.all(4.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _buildItem(_populars[index]);
      },
      itemCount: _populars.length,
    );
  }

  /// 创建每一项
  Widget _buildItem(Photo photo) {
    return Card(
      key: null,
      child: new Image.network(
        photo.sq150_url,
        fit: BoxFit.cover,
      ),
    );
  }
}
