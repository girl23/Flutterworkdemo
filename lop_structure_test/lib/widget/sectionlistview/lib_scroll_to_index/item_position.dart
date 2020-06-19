import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class TopItemPositionListener {
  /// Creates an [ItemPositionsListener] that can be used by a
  /// [ScrollablePositionedList] to return the current position of items.
  factory TopItemPositionListener.create() => ItemPositionNotifier();

  /// The position of items that are at least partially visible in the viewport.
  ValueListenable<Iterable<ItemPosition>> get itemPosition;
}

class ItemPositionNotifier implements TopItemPositionListener {
  @override
  final ValueNotifier<Iterable<ItemPosition>> itemPosition = ValueNotifier([]);
}

class ItemPosition {
  /// Create an [ItemPosition].
  const ItemPosition(
      {@required this.index,
      @required this.section,
      @required this.row,
      @required this.itemHeight});

  final int index;
  final int section;
  final int row;
  final double itemHeight;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final ItemPosition otherPosition = other;
    return otherPosition.index == index &&
        otherPosition.section == section &&
        otherPosition.row == row &&
        otherPosition.itemHeight == itemHeight;
  }

  @override
  int get hashCode =>
      31 *
          (31 * (31 * (7 + section.hashCode) + row.hashCode) + index.hashCode) +
      itemHeight.hashCode;

  @override
  String toString() =>
      'ItemPosition(index:$index, section:$section, row:$row, height:$itemHeight)';
}
