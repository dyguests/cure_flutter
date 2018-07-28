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
        return _buildItem(context, _populars[index]);
      },
      itemCount: _populars.length,
    );
  }

  /// 创建每一项
  Widget _buildItem(BuildContext context, Photo photo) {
    var inkWell = Positioned.fill(
        child: new Material(
            color: Colors.transparent,
            child: new InkWell(
//              splashColor: Colors.lightGreenAccent,
              onTap: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(photo.subject),
                    ));
              },
            )));
    var stack = Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.network(
            photo.sq150_url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Text(
            photo.subject,
            style: new TextStyle(fontSize: 12.0, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w200, fontFamily: "Roboto"),
          ),
        ),
        inkWell,
      ],
    );
    return Card(
      key: null,
      child: stack,
    );
  }
}
