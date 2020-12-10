import 'dart:ffi';

import 'package:flutter/material.dart';

abstract class LazyLoadListViewWidgetInterface {
  Future<void> onLazyLoadListViewRefresh(BuildContext context);
  void onLazyLoadListViewLoadMore(BuildContext context, double metricsPixels, double metricsMaxScrollExtent);
}

typedef LazyLoadListView_OnLazyLoadListViewInint = void Function();
typedef LazyLoadListView_OnLazyLoadListViewRefresh = Future<void> Function(BuildContext context);
typedef LazyLoadListView_OnLazyLoadListViewLoadMore = void Function(BuildContext context, double metricsPixels, double metricsMaxScrollExtent);
typedef LazyLoadListView_IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

enum LazyLoadListViewWidgetLoadMode {
  PRELOAD,
  RUNLOAD,
}

// ignore: must_be_immutable
class LazyLoadListViewWidget extends StatelessWidget {
  int? _lazyLoadListViewItemCount;
  double? _lazyLoadListViewScrollInfoMetricsPixels;
  double? _lazyLoadListViewScrollInfoMetricsMaxScrollExtent;
  LazyLoadListView_IndexedWidgetBuilder? _lazyLoadListViewItemBuilder;
  LazyLoadListView_OnLazyLoadListViewRefresh? _lazyLoadListViewOnRefresh;
  LazyLoadListView_OnLazyLoadListViewLoadMore? _lazyLoadListViewOnLoadMore;
  //add,2020-12-10增加加载更多数据的模式，PRELOAD-提前加载，RUNLOAD-达到加载。
  late LazyLoadListViewWidgetLoadMode _lazyLoadListViewWidgetLoadMode;
  static final Map<LazyLoadListViewWidgetLoadMode, double> _loadModeLoadpixels = {
    LazyLoadListViewWidgetLoadMode.PRELOAD: 0.00,
    LazyLoadListViewWidgetLoadMode.RUNLOAD: 100.00,
  };

  LazyLoadListViewWidget.builder({
    required int itemCount,
    required LazyLoadListView_IndexedWidgetBuilder itemBuilder,
    required LazyLoadListView_OnLazyLoadListViewRefresh onRefresh,
    required LazyLoadListView_OnLazyLoadListViewLoadMore onLoadMore,
    required LazyLoadListViewWidgetLoadMode loadMode,
  }) : assert(itemCount >= 0) {
    _lazyLoadListViewItemCount = itemCount;
    _lazyLoadListViewItemBuilder = itemBuilder;
    _lazyLoadListViewOnRefresh = onRefresh;
    _lazyLoadListViewOnLoadMore = onLoadMore;
    _lazyLoadListViewWidgetLoadMode = loadMode;
  }

  // 构建UI，采用Row
  uiBuild(BuildContext context) {
    return ListView.builder(
      itemCount: _lazyLoadListViewItemCount,
      itemBuilder: _lazyLoadListViewItemBuilder!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      //pull up to load more
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.maxScrollExtent - scrollInfo.metrics.pixels <= _loadModeLoadpixels[_lazyLoadListViewWidgetLoadMode]! &&
            scrollInfo.metrics.pixels != _lazyLoadListViewScrollInfoMetricsPixels) {
          _lazyLoadListViewScrollInfoMetricsPixels = scrollInfo.metrics.pixels;
          _lazyLoadListViewScrollInfoMetricsMaxScrollExtent = scrollInfo.metrics.maxScrollExtent;
          this._lazyLoadListViewOnLoadMore!(context, _lazyLoadListViewScrollInfoMetricsPixels!, _lazyLoadListViewScrollInfoMetricsMaxScrollExtent!);
        }
        return true;
      },
      child: RefreshIndicator(
        //pull dowan to refresh
        onRefresh: () async {
          this._lazyLoadListViewOnRefresh!(context);
        },
        child: uiBuild(context),
      ),
    );
  }
}
