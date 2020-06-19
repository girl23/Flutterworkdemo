import 'package:flutter/cupertino.dart';

///定义listView中的delegate
///
/// 1、包含section和对应section的row个数信息:ListViewDelegate
/// 2、每个section的builder和row的builder:ListViewDataourceDelegate

///计算总的section个数的builder
typedef SectionCount = int Function();

///计算每个section对应的row个数
typedef RowCountOfSection = int Function(int section);

///将列表的index转换成IndexPath
typedef IndexPathBuilder = IndexPath Function(int index);

class ListViewDelegate {
  final RowCountOfSection rowCountOfSection;
  SectionCount sectionCount;

  ListViewDelegate(
      {@required this.rowCountOfSection, SectionCount sectionCount})
      : assert(rowCountOfSection != null) {
    this.sectionCount = sectionCount ??
        () {
          return 1;
        };
  }
}

///section创建
typedef SectionWidgetBuilder = Widget Function(
    BuildContext context, IndexPath indexPath, int rawIndex);

///row创建
typedef CellWidgetBuilder = Widget Function(
    BuildContext context, IndexPath indexPath, int rawIndex);

class ListViewDataSourceDelegate {
  final CellWidgetBuilder cellWidgetBuilder;
  SectionWidgetBuilder sectionWidgetBuilder;

  ListViewDataSourceDelegate(
      {@required this.cellWidgetBuilder,
      SectionWidgetBuilder sectionWidgetBuilder,
      IndexedWidgetBuilder separatorWidgetBuilder})
      : assert(cellWidgetBuilder != null) {
    this.sectionWidgetBuilder = sectionWidgetBuilder;
  }
}

class IndexPath {
  int section;
  int row;

  IndexPath(this.section, this.row);
}

class IndexSectionModel {
  int index; //在list中的index
  int section; //在分组中的section
  int rowCount; ///对一个的section的rowCount
  IndexSectionModel(this.index, this.section, this.rowCount);
}
