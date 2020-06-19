import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lopstructuretest/widget/sectionlistview/lib_scroll_to_index/scroll_to_index.dart';
import 'package:lopstructuretest/widget/sectionlistview/lib_scroll_to_index/section_scroll_controller.dart';

import 'item_position.dart';
import 'list_view_delegate.dart';

class SectionListView extends StatefulWidget {
  final ListViewDelegate listViewDelegate;
  final ListViewDataSourceDelegate listViewDataSourceDelegate;
  final SectionScrollController controller;

  ///是否在顶部sectionHeader悬停
  final bool sectionHover;

  const SectionListView(
      {Key key,
      @required this.listViewDelegate,
      @required this.listViewDataSourceDelegate,
      this.controller,
      this.sectionHover = false})
      : assert(listViewDelegate != null),
        assert(listViewDataSourceDelegate != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SectionListViewState();
  }
}

class _SectionListViewState extends State<SectionListView> {
  int _topSection = -1;
  double _topPadding = 0;
  Container _topSectionWidget;
  double _preOffset = -1;
  int _preHitIndex = -1;
  double _preHitIndexTotalHeight = 0;

  @override
  void initState() {
    _translateDataMap();
    widget.controller
        ?.getScrollController(context)
        ?.addListener(_listViewScrollListener);
    super.initState();
  }

  ///将数据转成section定位。
  void _translateDataMap() {
    ///index表示list中的编号、i表示section编号
    int index = 0;
    int sectionCount = widget.listViewDelegate.sectionCount();
    final positions = <IndexSectionModel>[];
    for (int i = 0; i < sectionCount; i++) {
      int rowCount = widget.listViewDelegate.rowCountOfSection(i);
      positions.add(IndexSectionModel(index, i, rowCount));
      index += (widget.listViewDelegate.rowCountOfSection(i) + 1);
    }
    widget.controller.indexSectionList = positions;
  }

  Widget _buildItem(BuildContext context, int index) {
    IndexPath indexPath = _translateIndexToIndexPath(index);
    if (indexPath == null) return null;
    int row = indexPath.row;
    Widget child;
    if (row == -1) {
      ///header
      child = widget.listViewDataSourceDelegate
          .sectionWidgetBuilder(context, indexPath, index);
    } else {
      child = widget.listViewDataSourceDelegate
          .cellWidgetBuilder(context, indexPath, index);
    }
    return _wrapScrollTag(indexPath: indexPath, index: index, child: child);
  }

  Widget _wrapScrollTag({IndexPath indexPath, int index, Widget child}) {
    AutoScrollTagInfo info = AutoScrollTagInfo(
        widget.controller.getScrollController(context),
        indexPath.section,
        indexPath.row,
        index,
        child,
        false);

    return AutoScrollTag(
      info: info,
    );
  }

  IndexPath _translateIndexToIndexPath(int index) {
    IndexSectionModel indexSectionModel = widget.controller.indexSectionList
        .lastWhere(
            (IndexSectionModel indexSectionModel) =>
                indexSectionModel.index <= index,
            orElse: () => null);

    int section = indexSectionModel.section;
    int row = index - indexSectionModel.index;
    int rowCount = indexSectionModel.rowCount;
    if (row > rowCount) {
      ///越界，表示没有数据
      return null;
    }
    return IndexPath(section, row - 1);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        widget.controller.getScrollController(context);

    if (widget.sectionHover) {
      if (_topSectionWidget == null) {
        _topSectionWidget = Container(
          alignment: Alignment.centerLeft,
          color: Colors.grey,
        );
      }
      return Stack(
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            itemBuilder: _buildItem,
          ),
          Positioned(
            left: 0,
            top: _topPadding,
            right: 0,
            child: _topSectionWidget,
          ),
        ],
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemBuilder: _buildItem,
      );
    }
  }

  @override
  void dispose() {
    widget.controller
        ?.getScrollController(context)
        ?.removeListener(_listViewScrollListener);
    super.dispose();
  }

  Widget _getHeaderWidget(int section) {
    if (section < 0) {
      return null;
    }
    return widget.listViewDataSourceDelegate
        .sectionWidgetBuilder(context, IndexPath(section, -1), -1);
  }

  void _listViewScrollListener() {
    if (!widget.sectionHover) {
      return;
    }
    double offset = widget.controller?.getScrollController(context)?.offset;
    offset = NumUtil.getNumByValueDouble(offset, 2);
    if (_preOffset == offset) return;

    double totalHeight = _preHitIndexTotalHeight;
    ItemPosition hitItemPosition;
    if (_preOffset > offset) {
      //内容往下滑动，index往前推，找到减去对应item高度后首个<=offset的index
      for (int i = _preHitIndex; i >= 0; i--) {
        ItemPosition itemPosition =
            widget.controller?.getScrollController(context)?.itemHeightMap[i];
        if ((totalHeight - itemPosition.itemHeight) <= offset) {
          hitItemPosition = itemPosition;
          break;
        } else {
          totalHeight -= itemPosition.itemHeight;
        }
      }
    } else if (_preOffset <= offset) {
      //内容向上滑动，index往后推，找到第一个总高度 > offset的index
      if (totalHeight >= offset) {
        hitItemPosition = widget.controller
            ?.getScrollController(context)
            ?.itemHeightMap[_preHitIndex];
      } else {
        for (int i = _preHitIndex + 1;; i++) {
          ItemPosition itemPosition =
              widget.controller?.getScrollController(context)?.itemHeightMap[i];
          if (itemPosition == null) return;
          totalHeight += itemPosition.itemHeight;
          if (totalHeight > offset) {
            hitItemPosition = itemPosition;
            break;
          }
        }
      }
    }
    if (hitItemPosition == null) return;
    //判断是否更改顶部的header控件
    bool needSetWidgets = false;
    if (_topSection != hitItemPosition.section) {
      _topSection = hitItemPosition.section;
      _topSectionWidget = _getHeaderWidget(_topSection);
      needSetWidgets = true;
    }
    //计算对应的hitIndex的section的padding值
    double oldPadding = _topPadding;
    _topPadding = 0; //默认为0
    double topSectionHeaderHeight = widget.controller
        ?.getScrollController(context)
        ?.sectionHeightMap[_topSection];
    double subHeight = totalHeight - offset; //差值，表示需要露出来的高度
    if (subHeight < topSectionHeaderHeight) {
      //获取下一个item，判断item是否同section
      Map<int, RenderAutoScrollTag> tagMap =
          widget.controller?.getScrollController(context)?.tagMap;
      double totalHeight = subHeight;
      for (int i = hitItemPosition.index + 1;; i++) {
        RenderAutoScrollTag next = tagMap[i];
        if (next == null) break;
        if (next.section != _topSection) {
          //往下循环找到第一个不同section的行
          _topPadding = totalHeight - topSectionHeaderHeight;
          break;
        } else {
          totalHeight += next.size.height;
          if (totalHeight >= topSectionHeaderHeight) {
            break;
          } else {
            continue;
          }
        }
      }
    }
    _topPadding = NumUtil.getNumByValueDouble(_topPadding, 2);
    _preHitIndex = hitItemPosition.index;
    _preHitIndexTotalHeight = totalHeight;
    _preOffset = offset;

    //更新控件
    bool needSetState = (oldPadding != _topPadding) ? true : false;
    if (needSetWidgets && needSetState) {
      setState(() {
        // ignore: unnecessary_statements
        _topSectionWidget;
        _topPadding;
      });
    } else if (needSetWidgets) {
      setState(() {
        _topSectionWidget;
      });
    } else if (needSetState) {
      setState(() {
        _topPadding;
      });
    }
  }
}
