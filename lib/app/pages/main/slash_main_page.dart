import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/app/models/pexels_photos_model.dart';
import 'package:newslash/app/models/pexels_photos_show_model.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/http_util.dart';
import 'package:url_launcher/url_launcher.dart';

class SlashMainPageWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainPageWidgetsState();
}

class SlashMainPageWidgetsState extends State<SlashMainPageWidgets> {
  PexelsPhotosModel mPexelsPhotosModel;
  var _randomImagesSets = '';

  ListView getListView() => ListView.builder(
      itemCount: mPexelsPhotosModel.photosShow.length,
      itemBuilder: (BuildContext context, int position) {
        return getRowFrameLayout(position, context);
      });

  //https://medium.com/flutter-community/flutter-for-android-developers-how-to-design-framelayout-in-flutter-93a19fc7e7a6
  //FrameLayout
  Widget getRowFrameLayout(int dataIndex, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        color: Colors.tealAccent,
        child: new Stack(
          children: [
            Align(
              child: Container(
                child: listViewBuildRowCard(
                    mPexelsPhotosModel.photosShow[dataIndex]
                        .mPexelsPhotosPhotoModel.src.large,
                    context),
                constraints: BoxConstraints.expand(
                  width: MediaQuery.of(context).size.width, //w填充屏幕
                  height: MediaQuery.of(context).size.height * 3 / 5, //h填满屏幕1/2
                ),
              ),
              alignment: AlignmentDirectional.topStart,
            ),
            Align(
              child: Container(
                // color: Colors.red,
                color: Color(0x88000000),
                child: uiBuildRowIconButton(
                    dataIndex, MIconButtonType.download, context),
              ),
              alignment: AlignmentDirectional.topEnd,
            ),
          ],
        ),
      ),
    );
  }

  uiBuildRowIconButton(
      dataIndex, MIconButtonType mIconButtonType, BuildContext context) {
    var rowIconButton = mPexelsPhotosModel.photosShow[dataIndex].rowIconButton;
    return IconButton(
      icon: Icon(
        rowIconButton[mIconButtonType][MIconButtonStyle.showIcons],
        color: rowIconButton[mIconButtonType][MIconButtonStyle.isOnpressed]
            ? rowIconButton[mIconButtonType][MIconButtonStyle.onPressedColor]
            : rowIconButton[mIconButtonType][MIconButtonStyle.normalColor],
      ),
      onPressed: () {
        setState(() {
          rowIconButton[mIconButtonType][MIconButtonStyle.isOnpressed] =
              !rowIconButton[mIconButtonType][MIconButtonStyle.isOnpressed];
        });
        Future.delayed(Duration(milliseconds: 300)).then((value) {
          setState(() {
            rowIconButton[mIconButtonType][MIconButtonStyle.isOnpressed] =
                !rowIconButton[mIconButtonType][MIconButtonStyle.isOnpressed];
          });
          print(dataIndex);
        });
        onRowIconButtonPressed(dataIndex, mIconButtonType, context);
      },
    );
  }

  // 点击发送Event到body容器，实现内容切换效果
  onRowIconButtonPressed(
      int dataIndex, MIconButtonType mIconButtonType, BuildContext context) {
    // EventBusUtil.init().fire(mIconButtonType);

    var mPhotosSrc =
        mPexelsPhotosModel.photosShow[dataIndex].mPexelsPhotosPhotoModel.src;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content:
                Text('Are you sure to dowanload? \n' + mPhotosSrc.original),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // NavigatorUtils.goBack(context);
                },
                child: Text('cancle'),
              ),
              FlatButton(
                onPressed: () {
                  _launchUrl(mPhotosSrc.original);
                },
                textColor: Colors.red,
                child: Text('sure'),
              ),
            ],
          );
        });
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Unable to launch url $url');
    }
  }

  listViewBuildRowCard(String networkImageUrl, BuildContext context) {
    return Container(
      child: Image.network(
        networkImageUrl,
        fit: BoxFit.cover,
        repeat: ImageRepeat.noRepeat,
      ),
      constraints: BoxConstraints.expand(
        //对Image的约束
        width: MediaQuery.of(context).size.width, //w填充屏幕
        height: MediaQuery.of(context).size.height * 3 / 4, //h填满屏幕1/2
      ),
    );
  }

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: Text(_randomImagesSets),
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
        {'page': '1', 'per_page': '100', 'query': 'girl'}).then((value) {
      mPexelsPhotosModel = PexelsPhotosModel.fromJson(jsonDecode(value));
      print(mPexelsPhotosModel);
      setState(() {
        _randomImagesSets = value;
      });
    });
  }
}
