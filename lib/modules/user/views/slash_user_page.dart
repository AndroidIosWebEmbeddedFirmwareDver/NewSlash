import 'package:flutter/material.dart';
import 'package:newslash/modules/user/models/show/user_center_show_item.dart';
import 'package:newslash/modules/user/models/show/user_center_show_list.dart';
import 'package:newslash/modules/user/presenters/slash_user_presenter.dart';
import 'package:newslash/modules/user/views/user_amap.dart';
import 'package:newslash/plugins/lazy_load_list_view/lazy_load_list_view_widget.dart';
import 'package:newslash/utils/toast_msg_util.dart';

enum SlashUserPageWidgetsListParamsKey { HeaderItemHeight, BodyItemHeight }

class SlashUserPageWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SlashUserPageWidgetsState();
}

class SlashUserPageWidgetsState extends State<SlashUserPageWidgets> {
  final Map<SlashUserPageWidgetsListParamsKey, double> _listParams = {
    SlashUserPageWidgetsListParamsKey.HeaderItemHeight: 440,
    SlashUserPageWidgetsListParamsKey.BodyItemHeight: 44,
  };

  late UserCenterListShowList _mUserCenterListShowList;

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    var lazyLoadListViewWidget = LazyLoadListViewWidget.builder(
      itemCount: _mUserCenterListShowList.items.length,
      itemBuilder: (BuildContext context, int position) => getRowFrameLayout(position, context),
      onLoadMore: (BuildContext context, double metricsPixels, double metricsMaxScrollExtent) => () {},
      onRefresh: (context) async {},
      loadMode: LazyLoadListViewWidgetLoadMode.RUNLOAD,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: lazyLoadListViewWidget,
            ),
            flex: 150),
      ],
    );
  }

  Widget getRowFrameLayout(int dataIndex, BuildContext context) {
    if (dataIndex == 0)
      return buildListViewHeaderItem(dataIndex, context, _mUserCenterListShowList.items[dataIndex]);
    else
      return buildListViewBodyItem(dataIndex, context, _mUserCenterListShowList.items[dataIndex]);
  }

  Widget buildListViewBodyItem(int dataIndex, BuildContext context, UserCenterShowItem mUserCenterShowItem) {
    return GestureDetector(
      child: Padding(
        // padding: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Container(
          color: Color(0x88e1e1e1),
          height: _listParams[SlashUserPageWidgetsListParamsKey.BodyItemHeight],
          child: Center(
            child: Text(
              mUserCenterShowItem.title,
              style: TextStyle(
                  // color: Colors.white,
                  // fontSize: 33,
                  ),
            ),
          ),
        ),
      ),
      onTap: () {
        ToastMsgUtil.showNromMsg(context, 'Touch , $dataIndex');
        if (mUserCenterShowItem.key == UserCenterListShowListKey.about) {
          SlashUserPresenter.showAbout(context);
        }
      },
    );
  }

  Widget buildListViewHeaderItem(int dataIndex, BuildContext context, UserCenterShowItem mUserCenterShowItem) {
    return Padding(
      // padding: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        height: _listParams[SlashUserPageWidgetsListParamsKey.HeaderItemHeight],
        color: Color(0x88e1e1e1),
        child: Center(
          child: GestureDetector(
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
              ),
            ),
            onTap: () {
              // ToastMsgUtil.showNromMsg(context, 'Touch , $dataIndex');
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return uiBuild(context);
    return UserAmapWidget();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mUserCenterListShowList = UserCenterListShowList();
  }
}
