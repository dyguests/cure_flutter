import 'package:cure/io/dio/dio_client.dart';
import 'package:cure/model/photo.dart';
import 'package:cure/ui/photo_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final _scrollController = ScrollController();

  final _populars = <Photo>[];

  int page = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
        _loadMore(loadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cure'),
//        actions: <Widget>[IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildBody(),
    );
  }

  void _refreshData() {
    _loadMore();
  }

  Widget _buildBody() {
    return GridView.builder(
      controller: _scrollController,
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
    return Card(
      key: null,
      child: Stack(
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
          Positioned.fill(
              child: new Material(
                  color: Colors.transparent,
                  child: new InkWell(
//              splashColor: Colors.lightGreenAccent,
                    onTap: () {
                      PhotoPage.launch(context, photo);
                    },
                  ))),
        ],
      ),
    );
  }

  void _loadMore({bool loadMore: false}) {
    if (_isLoading) {
      return;
    }

    _isLoading = true;

    DioClient.getInstance().photoService.getPhotos(page).then((list) {
      setState(() {
        page++;
        _isLoading = false;

        _populars.addAll(list);
      });
    });
  }
}
