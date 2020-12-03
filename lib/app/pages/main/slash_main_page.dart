import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/app/models/pexels_photos_model.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/http_util.dart';

class SlashMainPageWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainPageWidgetsState();
}

class SlashMainPageWidgetsState extends State<SlashMainPageWidgets> {
  PexelsPhotosModel mPexelsPhotosModel;
  var _randomImagesSets = '';

  ListView getListView() => ListView.builder(
      itemCount: mPexelsPhotosModel.photos.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        // child: CopyableText("$i、${widgets[i]["title"]}"));
        child: Image.network(mPexelsPhotosModel.photos[i].src.medium));
  }

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: Text(_randomImagesSets),
              color: Colors.white,
            ),
            flex: 150),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mPexelsPhotosModel != null ? getListView() : uiBuild(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpUtil.init().httpSearchImage(SlashSource.Pexels,
        {'page': '1', 'per_page': '100', 'query': 'people'}).then((value) {
      mPexelsPhotosModel = PexelsPhotosModel.fromJson(jsonDecode(value));
      print(mPexelsPhotosModel);
      setState(() {
        _randomImagesSets = value;
      });
    });
  }
}
