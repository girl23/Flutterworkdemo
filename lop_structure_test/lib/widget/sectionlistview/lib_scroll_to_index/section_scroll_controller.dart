import 'package:flutter/cupertino.dart';
import 'package:lopstructuretest/widget/sectionlistview/lib_scroll_to_index/scroll_to_index.dart';
import 'list_view_delegate.dart';

class SectionScrollController {
  List<IndexSectionModel> indexSectionList = [];

  AutoScrollController _autoScrollController;

  AutoScrollController getScrollController(BuildContext context) {
    if (_autoScrollController == null) {
      _autoScrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical,
      );
    }
    return _autoScrollController;
  }

  Future scrollToIndex(IndexPath indexPath, {Duration duration}) async {
    int section = indexPath.section;
    int row = indexPath.row;
    IndexSectionModel indexSectionModel = indexSectionList.lastWhere(
        (IndexSectionModel indexSectionModel) =>
            indexSectionModel.section == section,
        orElse: () => null);
    if (indexSectionModel != null && row < indexSectionModel.rowCount) {
      int sectionIndex = indexSectionModel.index;
      int positionIndex = sectionIndex + row + 1;
      if (row == 0) {
        positionIndex = sectionIndex;
      }
      _autoScrollController.scrollToIndex(positionIndex,
          preferPosition: AutoScrollPosition.begin,
          duration: duration,
          sectionIndex: sectionIndex);
    }
  }

}
