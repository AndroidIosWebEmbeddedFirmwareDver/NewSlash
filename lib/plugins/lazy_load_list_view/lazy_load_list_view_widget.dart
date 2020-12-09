import 'package:flutter/material.dart';

typedef LazyLoadListView_OnLazyLoadListViewInint = void Function();
typedef LazyLoadListView_OnLazyLoadListViewRefresh = Future<void> Function();
typedef LazyLoadListView_OnLazyLoadListViewLoadMore = void Function(double metricsPixels, double metricsMaxScrollExtent);
typedef LazyLoadListView_IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

// ignore: must_be_immutable
class LazyLoadListViewWidget extends StatelessWidget {
  int? _lazyLoadListViewItemCount;
  double? _lazyLoadListViewScrollInfoMetricsPixels;
  double? _lazyLoadListViewScrollInfoMetricsMaxScrollExtent;
  LazyLoadListView_IndexedWidgetBuilder? _lazyLoadListViewItemBuilder;
  LazyLoadListView_OnLazyLoadListViewRefresh? _lazyLoadListViewOnRefresh;
  LazyLoadListView_OnLazyLoadListViewLoadMore? _lazyLoadListViewOnLoadMore;

  LazyLoadListViewWidget.builder({
    required int itemCount,
    required LazyLoadListView_IndexedWidgetBuilder itemBuilder,
    required LazyLoadListView_OnLazyLoadListViewRefresh onRefresh,
    required LazyLoadListView_OnLazyLoadListViewLoadMore onLoadMore,
  }) : assert(itemCount >= 0) {
    _lazyLoadListViewItemCount = itemCount;
    _lazyLoadListViewItemBuilder = itemBuilder;
    _lazyLoadListViewOnRefresh = onRefresh;
    _lazyLoadListViewOnLoadMore = onLoadMore;
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
    // return uiBuild(context);
    return NotificationListener<ScrollNotification>(
      //pull dowan up to load more
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && scrollInfo.metrics.pixels != _lazyLoadListViewScrollInfoMetricsPixels) {
          _lazyLoadListViewScrollInfoMetricsPixels = scrollInfo.metrics.pixels;
          _lazyLoadListViewScrollInfoMetricsMaxScrollExtent = scrollInfo.metrics.maxScrollExtent;
          this._lazyLoadListViewOnLoadMore!(_lazyLoadListViewScrollInfoMetricsPixels!, _lazyLoadListViewScrollInfoMetricsMaxScrollExtent!);
        }
        return true;
      },
      child: RefreshIndicator(
        //pull dowan to refresh
        onRefresh: this._lazyLoadListViewOnRefresh!,
        child: uiBuild(context),
      ),
    );
  }
}
