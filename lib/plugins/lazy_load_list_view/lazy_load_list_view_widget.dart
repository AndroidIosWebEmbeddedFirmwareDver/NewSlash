import 'package:flutter/material.dart';

// class LazyLoadListViewWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => LazyLoadListViewWidgetState();
// }

// abstract class LazyLoadListViewWidgetInterface {
//   onLazyLoadListViewInint() {}
//   onLazyLoadListViewRefresh() {}
//   onLazyLoadListViewLoadMore() {}
// }

typedef LazyLoadListView_OnLazyLoadListViewInint = void Function();
typedef LazyLoadListView_OnLazyLoadListViewRefresh = void Function();
typedef LazyLoadListView_OnLazyLoadListViewLoadMore = void Function();
typedef LazyLoadListView_IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

// class LazyLoadListViewWidgetState extends State<LazyLoadListViewWidget> implements LazyLoadListViewWidgetInterface {
class LazyLoadListViewWidget extends StatelessWidget {
  ScrollController? _scrollController;
  int? _lazyLoadListViewItemCount;
  LazyLoadListView_IndexedWidgetBuilder? _lazyLoadListViewItemBuilder;
  LazyLoadListView_OnLazyLoadListViewRefresh? _lazyLoadListViewOnRefresh;
  LazyLoadListView_OnLazyLoadListViewLoadMore? _lazyLoadListViewOnLoadMore;

  LazyLoadListViewWidget.builder({
    required int itemCount,
    required LazyLoadListView_IndexedWidgetBuilder itemBuilder,
    required LazyLoadListView_OnLazyLoadListViewRefresh onRefresh,
    required LazyLoadListView_OnLazyLoadListViewLoadMore onLoadMore,
  }) : assert(itemCount == null || itemCount >= 0) {
    _lazyLoadListViewItemCount = itemCount;
    _lazyLoadListViewItemBuilder = itemBuilder;
    _lazyLoadListViewOnRefresh = onRefresh;
    _lazyLoadListViewOnLoadMore = onLoadMore;
  }

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    _scrollController = ScrollController();
    return ListView.builder(
      itemCount: _lazyLoadListViewItemCount,
      controller: _scrollController!,
      itemBuilder: _lazyLoadListViewItemBuilder!,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiBuild(context);
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   onLazyLoadListViewInint();
  // }

  @override
  onLazyLoadListViewInint() {
    // TODO: implement onLazyLoadListViewInint
    // throw UnimplementedError();
    print('onLazyLoadListViewInint');
  }

  @override
  onLazyLoadListViewLoadMore() {
    // TODO: implement onLazyLoadListViewLoadMore
    // throw UnimplementedError();
    print('onLazyLoadListViewLoadMore');
  }

  @override
  onLazyLoadListViewRefresh() {
    // TODO: implement onLazyLoadListViewRefresh
    // throw UnimplementedError();
    print('onLazyLoadListViewRefresh');
  }
}
