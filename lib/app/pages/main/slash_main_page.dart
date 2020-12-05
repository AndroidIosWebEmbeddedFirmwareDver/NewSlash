import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/app/models/pexels_photos_model.dart';
import 'package:newslash/app/models/pexels_photos_show_model.dart';
import 'package:newslash/utils/app_system_params.dart';
import 'package:newslash/utils/enum_util.dart';
import 'package:newslash/utils/event_bus_util.dart';
import 'package:newslash/utils/http_util.dart';
import 'package:newslash/utils/snack_bar_util.dart';
import 'package:url_launcher/url_launcher.dart';

class SlashMainPageWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashMainPageWidgetsState();
}

class SlashMainPageWidgetsState extends State<SlashMainPageWidgets> {
  late PexelsPhotosModel? mPexelsPhotosModel;
  var _randomImagesSets = '';

  ListView getListView() => ListView.builder(
      itemCount: mPexelsPhotosModel!.photosShow.length,
      itemBuilder: (BuildContext context, int position) {
        return getRowFrameLayout(position, context);
      });

  //https://medium.com/flutter-community/flutter-for-android-developers-how-to-design-framelayout-in-flutter-93a19fc7e7a6
  //FrameLayout
  Widget getRowFrameLayout(int dataIndex, BuildContext context) {
    var photosShow = mPexelsPhotosModel!.photosShow[dataIndex];
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        // color: Color(0x88000000),
        child: new Stack(
          children: [
            Align(
              child: listViewBuildRowCard(
                  photosShow!.mPexelsPhotosPhotoModel.src.large, context),
              alignment: AlignmentDirectional.topStart,
            ),
            Align(
              // child: uiBuildRowIconButton(dataIndex,MIconButtonType.download,context),
              child: uiBuildRowIconTapWidget(
                  dataIndex, MIconButtonType.download, context),
              alignment: AlignmentDirectional.topEnd,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88000000), //底色,阴影颜色
              offset: Offset(0, 4), //阴影位置,从什么位置开始
              blurRadius: 4, // 阴影模糊层度
              spreadRadius: 0, //阴影模糊大小
            ),
          ],
        ),
      ),
    );
  }

  uiBuildRowIconTapWidget(
      dataIndex, MIconButtonType mIconButtonType, BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        // width: MediaQuery.of(context).size.width * 1 / 5, //w填充屏幕
        height: MediaQuery.of(context).size.height * 3 / 5, //h填满屏幕1/2
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
            flex: 12,
          ),
          Expanded(
            child: uiBuildRowIconTapContentWidget(dataIndex, context),
            flex: 1,
          ),
        ],
      ),
    );
  }

  uiBuildRowIconTapContentWidget(dataIndex, BuildContext context) {
    var photosShow = mPexelsPhotosModel!.photosShow[dataIndex];
    return Container(
      color: Color(0x88000000),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Text(
                AppSystemParams.init()
                        .getParams(AppSystemParamsKeys.slashSourceSite) +
                    '(' +
                    (photosShow != null
                        ? photosShow.mPexelsPhotosPhotoModel.photographer
                        : '') +
                    '),License by coo.',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            flex: 7,
          ),
          Expanded(
            child: uiBuildRowIconButton(
                dataIndex, MIconButtonType.favorite, context),
            flex: 1,
          ),
          Expanded(
            child: uiBuildRowIconButton(
                dataIndex, MIconButtonType.download, context),
            flex: 1,
          ),
        ],
      ),
    );
  }

  uiBuildRowIconButton(
      int dataIndex, MIconButtonType mIconButtonType, BuildContext context) {
    var photosShow = mPexelsPhotosModel!.photosShow[dataIndex]!;
    return Container(
      color: photosShow.mButtons[mIconButtonType]!.bgColor,
      child: IconButton(
        icon: Icon(
          photosShow.mButtons[mIconButtonType]!.showIcons,
          color: photosShow.mButtons[mIconButtonType]!.isOnpressed
              ? photosShow.mButtons[mIconButtonType]!.onPressedColor
              : photosShow.mButtons[mIconButtonType]!.normalColor,
        ),
        onPressed: () {
          onRowIconButtonPressed(dataIndex, mIconButtonType, context);
        },
      ),
    );
  }

  // 点击发送Event到body容器，实现内容切换效果
  onRowIconButtonPressed(
      dataIndex, MIconButtonType mIconButtonType, BuildContext context) {
    // EventBusUtil.init().fire(mIconButtonType);
    setState(() {
      // mPexelsPhotosModel.photosShow[dataIndex].rowIconButton[mIconButtonType]
      //     [MIconButtonStyle.isOnpressed] = !mPexelsPhotosModel
      //         .photosShow[dataIndex].rowIconButton[mIconButtonType]
      //     [MIconButtonStyle.isOnpressed];
    });
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      setState(() {
        // mPexelsPhotosModel.photosShow[dataIndex].rowIconButton[mIconButtonType]
        //     [MIconButtonStyle.isOnpressed] = !mPexelsPhotosModel
        //         .photosShow[dataIndex].rowIconButton[mIconButtonType]
        //     [MIconButtonStyle.isOnpressed];
      });
      print(dataIndex);
    });
    if (mIconButtonType == MIconButtonType.download) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Text('Are you sure to dowanload? \n' +
                mPexelsPhotosModel!.photosShow[dataIndex]!
                    .mPexelsPhotosPhotoModel.src.original),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context)!.pop();
                  // NavigatorUtils.goBack(context);
                },
                child: Text('cancle'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context)!.pop();
                  _launchUrl(mPexelsPhotosModel!.photosShow[dataIndex]!
                      .mPexelsPhotosPhotoModel.src.original);
                },
                textColor: Colors.red,
                child: Text('sure'),
              ),
            ],
          );
        },
      );
    }
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
        width: MediaQuery.of(context).size.width, //w填充屏幕
        height: MediaQuery.of(context).size.height * 3 / 5, //h填满屏幕1/2
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
        {'page': '1', 'per_page': '100', 'query': 'river'}).then((value) {
      mPexelsPhotosModel = PexelsPhotosModel.fromJson(jsonDecode(value!));
      setState(() {
        _randomImagesSets = value;
      });
    });
  }
}
