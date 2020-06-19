//Copyright (C) 2019 Potix Corporation. All Rights Reserved.
//History: Tue Apr 24 09:17 CST 2019
// Author: Jerry Chen

library scroll_to_index;

import 'dart:async';
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import 'item_position.dart';
import 'util.dart';

const defaultScrollDistanceOffset = 100.0;
const defaultDurationUnit = 40;

const _millisecond = Duration(milliseconds: 1);
const _highlightDuration = const Duration(seconds: 3);
const scrollAnimationDuration = Duration(milliseconds: 250);

typedef Rect ViewportBoundaryGetter();
typedef double AxisValueGetter(Rect rect);

Rect defaultViewportBoundaryGetter() => Rect.zero;

abstract class AutoScrollController implements ScrollController {
  factory AutoScrollController(
      {double initialScrollOffset: 0.0,
      bool keepScrollOffset: true,
      double suggestedRowHeight,
      ViewportBoundaryGetter viewportBoundaryGetter:
          defaultViewportBoundaryGetter,
      Axis axis,
      String debugLabel,
      AutoScrollController copyTagsFrom}) {
    return SimpleAutoScrollController(
        initialScrollOffset: initialScrollOffset,
        keepScrollOffset: keepScrollOffset,
        suggestedRowHeight: suggestedRowHeight,
        viewportBoundaryGetter: viewportBoundaryGetter,
        beginGetter: axis == Axis.horizontal ? (r) => r.left : (r) => r.top,
        endGetter: axis == Axis.horizontal ? (r) => r.right : (r) => r.bottom,
        copyTagsFrom: copyTagsFrom,
        debugLabel: debugLabel);
  }

  /// used to quick scroll to a index if the row height is the same
  double get suggestedRowHeight;

  /// used to make the additional boundary for viewport
  /// e.g. a sticky header which covers the real viewport of a list view
  ViewportBoundaryGetter get viewportBoundaryGetter;

  /// used to choose which direction you are using.
  /// e.g. axis == Axis.horizontal ? (r) => r.left : (r) => r.top
  AxisValueGetter get beginGetter;
  AxisValueGetter get endGetter;

  /// detect if it's in scrolling (scrolling is a async process)
  bool get isAutoScrolling;

  /// all layout out states will be put into this map
  Map<int, RenderAutoScrollTag> get tagMap;
  Map<int, double> get sectionHeightMap;
  Map<int, ItemPosition> get itemHeightMap;

  /// used to chaining parent scroll controller
  set parentController(ScrollController parentController);

  /// check if there is a parent controller
  bool get hasParentController;

  /// scroll to the giving index
  Future scrollToIndex(int index,
      {Duration duration: scrollAnimationDuration,
      AutoScrollPosition preferPosition,
      int sectionIndex});

  /// highlight the item
  Future highlight(int index,
      {bool cancelExistHighlights: true,
      Duration highlightDuration: _highlightDuration,
      bool animated: true});

  /// cancel all highlight item immediately.
  void cancelAllHighlights();

  /// check if the state is created. that is, is the indexed widget is layout out.
  /// NOTE: state created doesn't mean it's in viewport. it could be a buffer range, depending on flutter's implementation.
  bool isIndexStateInLayoutRange(int index);
}

class SimpleAutoScrollController extends ScrollController
    with AutoScrollControllerMixin {
  @override
  final double suggestedRowHeight;
  @override
  final ViewportBoundaryGetter viewportBoundaryGetter;
  @override
  final AxisValueGetter beginGetter;
  @override
  final AxisValueGetter endGetter;

  SimpleAutoScrollController(
      {double initialScrollOffset: 0.0,
      bool keepScrollOffset: true,
      this.suggestedRowHeight,
      this.viewportBoundaryGetter: defaultViewportBoundaryGetter,
      @required this.beginGetter,
      @required this.endGetter,
      AutoScrollController copyTagsFrom,
      String debugLabel})
      : super(
            initialScrollOffset: initialScrollOffset,
            keepScrollOffset: keepScrollOffset,
            debugLabel: debugLabel) {
    if (copyTagsFrom != null) tagMap.addAll(copyTagsFrom.tagMap);
  }
}

class PageAutoScrollController extends PageController
    with AutoScrollControllerMixin {
  @override
  final double suggestedRowHeight;
  @override
  final ViewportBoundaryGetter viewportBoundaryGetter;
  @override
  final AxisValueGetter beginGetter = (r) => r.left;
  @override
  final AxisValueGetter endGetter = (r) => r.right;

  PageAutoScrollController(
      {int initialPage: 0,
      bool keepPage: true,
      double viewportFraction: 1.0,
      this.suggestedRowHeight,
      this.viewportBoundaryGetter: defaultViewportBoundaryGetter,
      AutoScrollController copyTagsFrom,
      String debugLabel})
      : super(
            initialPage: initialPage,
            keepPage: keepPage,
            viewportFraction: viewportFraction) {
    if (copyTagsFrom != null) tagMap.addAll(copyTagsFrom.tagMap);
  }
}

enum AutoScrollPosition { begin, middle, end }
mixin AutoScrollControllerMixin on ScrollController
    implements AutoScrollController {
  @override
  final Map<int, RenderAutoScrollTag> tagMap = <int, RenderAutoScrollTag>{};

  @override
  final Map<int, double> sectionHeightMap = <int, double>{};

  @override
  final Map<int, ItemPosition> itemHeightMap = <int, ItemPosition>{};

  double get suggestedRowHeight;
  ViewportBoundaryGetter get viewportBoundaryGetter;
  AxisValueGetter get beginGetter;
  AxisValueGetter get endGetter;

  bool __isAutoScrolling = false;
  set _isAutoScrolling(bool isAutoScrolling) {
    __isAutoScrolling = isAutoScrolling;
    if (!isAutoScrolling &&
        hasClients) //after auto scrolling, we should sync final scroll position without flag on
      notifyListeners();
  }

  @override
  bool get isAutoScrolling => __isAutoScrolling;

  ScrollController _parentController;
  @override
  set parentController(ScrollController parentController) {
    if (_parentController == parentController) return;

    final isNotEmpty = positions.isNotEmpty;
    if (isNotEmpty && _parentController != null) {
      for (final p in _parentController.positions)
        if (positions.contains(p)) _parentController.detach(p);
    }

    _parentController = parentController;

    if (isNotEmpty && _parentController != null)
      for (final p in positions) _parentController.attach(p);
  }

  @override
  bool get hasParentController => _parentController != null;

  @override
  void attach(ScrollPosition position) {
    super.attach(position);

    _parentController?.attach(position);
  }

  @override
  void detach(ScrollPosition position) {
    _parentController?.detach(position);

    super.detach(position);
  }

  static const maxBound = 30; // 0.5 second if 60fps
  @override
  Future scrollToIndex(int index,
      {Duration duration: scrollAnimationDuration,
      AutoScrollPosition preferPosition,
      int sectionIndex}) async {
    return co(
        this,
        () => _scrollToIndex(index,
            duration: duration,
            preferPosition: preferPosition,
            sectionIndex: sectionIndex));
  }

  Future _scrollToIndex(int index,
      {Duration duration: scrollAnimationDuration,
      AutoScrollPosition preferPosition,
      int sectionIndex}) async {
    assert(duration > Duration.zero);

    // In listView init or reload case, widget state of list item may not be ready for query.
    // this prevent from over scrolling becoming empty screen or unnecessary scroll bounce.
    Future makeSureStateIsReady() async {
      for (var count = 0; count < maxBound; count++) {
        if (_isEmptyStates) {
          await _waitForWidgetStateBuild();
        } else
          return null;
      }

      return null;
    }

    await makeSureStateIsReady();

    if (index == null || !hasClients) return null;

    // two cases,
    // 1. already has state. it's in viewport layout
    // 2. doesn't have state yet. it's not in viewport so we need to start scrolling to make it into layout range.
    if (isIndexStateInLayoutRange(index)) {
      ///当前控件在缓存中
      _isAutoScrolling = true;

      await _bringIntoViewportIfNeed(index, sectionIndex, preferPosition,
          (double offset) async {
        await animateTo(offset, duration: duration, curve: Curves.ease);
        await _waitForWidgetStateBuild();
        return null;
      });

      _isAutoScrolling = false;
    } else {
      /// 未创建控件，则根据当前已存在列表考虑滑动
      // the idea is scrolling based on either
      // 1. suggestedRowHeight or
      // 2. testDistanceOffset
      double prevOffset = offset - 1;
      double currentOffset = offset;
      bool contains = false;
      Duration spentDuration = const Duration();
      double lastScrollDirection = 0.5; // alignment, default center;
      final moveDuration = duration ~/ defaultDurationUnit;

      _isAutoScrolling = true;

      /// ideally, the suggest row height will move to the final corrent offset approximately in just one scroll(iteration).
      /// if the given suggest row height is the minimal/maximal height in variable row height enviroment,
      /// we can just use viewport calculation to reach the final offset in other iteration.
      bool usedSuggestedRowHeightIfAny = true;
      while (prevOffset != currentOffset &&
          !(contains = isIndexStateInLayoutRange(index))) {
        //循环判断目标index是否在缓存中
        prevOffset = currentOffset;
        final nearest = _getNearestIndex(index);

        ///获取离目标index最近的index
        ///得到需要移动的距离
        final moveTarget =
            _forecastMoveUnit(index, nearest, usedSuggestedRowHeightIfAny);
        if (moveTarget < 0) //can't forecast the move range
          return null;
        // assume suggestRowHeight will move to correct offset in just one time.
        // if the rule doesn't work (in variable row height case), we will use backup solution (non-suggested way)
        final suggestedDuration =
            usedSuggestedRowHeightIfAny && suggestedRowHeight != null
                ? duration
                : null;
        usedSuggestedRowHeightIfAny = false; // just use once
        lastScrollDirection = moveTarget - prevOffset > 0 ? 1 : 0; //滑动方向
        currentOffset = moveTarget;
        spentDuration += suggestedDuration ?? moveDuration;
        final oldOffset = offset;

        ///移动到新的位置
        await animateTo(currentOffset,
            duration: suggestedDuration ?? moveDuration, curve: Curves.ease);

        ///等待控件绘制
        await _waitForWidgetStateBuild();
        //判断index是否在里面，否则继续循环等待
        if (!hasClients || offset == oldOffset) {
          // already scroll to begin or end
          contains = isIndexStateInLayoutRange(index);
          break;
        }
      }
      _isAutoScrolling = false;

      ///index已经出现在缓存中
      if (contains && hasClients) {
        //将控件移动到可视区域中
        await _bringIntoViewportIfNeed(index, sectionIndex,
            preferPosition ?? _alignmentToPosition(lastScrollDirection),
            (finalOffset) async {
          if (finalOffset != offset) {
            _isAutoScrolling = true;
            final remaining = duration - spentDuration;
            await animateTo(finalOffset,
                duration: remaining <= Duration.zero ? _millisecond : remaining,
                curve: Curves.ease);
            await _waitForWidgetStateBuild();

            // not sure why it doesn't scroll to the given offset, try more within 3 times
            //如果offset还没有正确，则再尝试三次
            if (hasClients && offset != finalOffset) {
              final count = 3;
              for (var i = 0;
                  i < count && hasClients && offset != finalOffset;
                  i++) {
                await animateTo(finalOffset,
                    duration: _millisecond, curve: Curves.ease);
                await _waitForWidgetStateBuild();
              }
            }
            _isAutoScrolling = false;
          }
        });
      }
    }

    return null;
  }

  @override
  Future highlight(int index,
      {bool cancelExistHighlights: true,
      Duration highlightDuration: _highlightDuration,
      bool animated: true}) async {
//    final tag = tagMap[index];
//    return tag == null ? null : await tag.highlight(cancelExisting: cancelExistHighlights, highlightDuration: highlightDuration, animated: animated);
  }

  @override
  void cancelAllHighlights() {
//    _cancelAllHighlights();
  }

  @override
  bool isIndexStateInLayoutRange(int index) => tagMap[index] != null;

  /// this means there is no widget state existing, usually happened before build.
  /// we should wait for next frame.
  bool get _isEmptyStates => tagMap.isEmpty;

  /// wait until the [SchedulerPhase] in [SchedulerPhase.persistentCallbacks].
  /// it means if we do animation scrolling to a position, the Future call back will in [SchedulerPhase.midFrameMicrotasks].
  /// if we want to search viewport element depending on Widget State, we must delay it to [SchedulerPhase.persistentCallbacks].
  /// which is the phase widget build/layout/draw
  Future _waitForWidgetStateBuild() => SchedulerBinding.instance.endOfFrame;

  /// NOTE: this is used to forcase the nearestIndex. if the the index equals targetIndex,
  /// we will use the function, calling _directionalOffsetToRevealInViewport to get move unit.
  /// 预测需要移动的距离
  double _forecastMoveUnit(
      int targetIndex, int currentNearestIndex, bool useSuggested) {
    assert(targetIndex != currentNearestIndex);
    currentNearestIndex = currentNearestIndex ?? 0; //null as none of state

    final alignment = targetIndex > currentNearestIndex ? 1.0 : 0.0;
    double absoluteOffsetToViewport;

    if (tagMap[currentNearestIndex] == null) return -1;

    if (useSuggested && suggestedRowHeight != null) {
      //使用建议的行高
      final indexDiff =
          (targetIndex - currentNearestIndex); //index差。负数表示下滑，出现在顶部0，正数上滑，出现在底部
      ///计算_offsetToRevealInViewport出现可视区域中顶部或者底部的偏移量
      final offsetToLastState = _offsetToRevealInViewport(
          currentNearestIndex, indexDiff <= 0 ? 0 : 1);
      //由于使用建议的高度，可以根据行差数计算偏移量
      absoluteOffsetToViewport = math.max(
          offsetToLastState.offset + indexDiff * suggestedRowHeight, 0);
    } else {
      //不需要计算，只需要将当前最近的index的控件展示到可视区域中
      final offsetToLastState =
          _offsetToRevealInViewport(currentNearestIndex, alignment);
      assert((offsetToLastState?.offset ?? 0) >= 0,
          "ERROR: %%%%%%%%%%%%%%: $targetIndex, $currentNearestIndex, $alignment, $offsetToLastState, ${tagMap.keys.toList().join(',')}");
      absoluteOffsetToViewport = offsetToLastState?.offset;
      if (absoluteOffsetToViewport == null)
        absoluteOffsetToViewport = defaultScrollDistanceOffset;
    }
    return absoluteOffsetToViewport;
  }

  ///
  /// 获取缓存中离目标编号最近的编号
  int _getNearestIndex(int index) {
    final list = tagMap.keys;
    if (list.isEmpty) return null;

    final sorted = list.toList()
      ..sort((int first, int second) => first.compareTo(second));
    final min = sorted.first;
    final max = sorted.last;
    return (index - min).abs() < (index - max).abs() ? min : max;
  }

  /// bring the state node (already created but all of it may not be fully in the viewport) into viewport
  Future _bringIntoViewportIfNeed(int index, int sectionIndex,
      AutoScrollPosition preferPosition, Future move(double offset)) async {
    final begin = _directionalOffsetToRevealInViewport(
        index, 0, sectionIndex); //滑动出现在顶部的距离
    final end = _directionalOffsetToRevealInViewport(
        index, 1, sectionIndex); //滑动出现在底部的距离

    if (preferPosition != null) {
      //根据需要出现的位置，计算滑动的位置
      double targetOffset = _directionalOffsetToRevealInViewport(
          index, _positionToAlignment(preferPosition), sectionIndex);

      if (targetOffset < position.minScrollExtent)
        targetOffset = position.minScrollExtent;
      else if (targetOffset > position.maxScrollExtent)
        targetOffset = position.maxScrollExtent;
      await move(targetOffset);
    } else {
      final alreadyInViewport = offset < begin && offset > end;
      if (!alreadyInViewport) {
        double value;
        if (preferPosition != null) {
          value = preferPosition == AutoScrollPosition.begin
              ? begin
              : preferPosition == AutoScrollPosition.end
                  ? end
                  : _directionalOffsetToRevealInViewport(
                      index, 0.5, sectionIndex);
        } else if ((end - offset).abs() < (begin - offset).abs())
          value = end;
        else
          value = begin;

        await move(value > 0 ? value : 0);
      }
    }
  }

  double _positionToAlignment(AutoScrollPosition position) {
    if (position == null) return null;

    return position == AutoScrollPosition.begin
        ? 0
        : position == AutoScrollPosition.end ? 1 : 0.5;
  }

  AutoScrollPosition _alignmentToPosition(double alignment) => alignment == 0
      ? AutoScrollPosition.begin
      : alignment == 1 ? AutoScrollPosition.end : AutoScrollPosition.middle;

  /// return offset, which is a absolute offset to bring the target index object into the location(depends on [direction]) of viewport
  /// see also: _offsetYToRevealInViewport()
  double _directionalOffsetToRevealInViewport(
      int index, double alignment, int sectionIndex) {
    assert(alignment == 0 || alignment == 0.5 || alignment == 1);
    assert(beginGetter != null && endGetter != null);
    // 1.0 bottom, 0.5 center, 0.0 begin if list is vertically from begin to end
    final tagOffsetInViewport = _offsetToRevealInViewport(index, alignment);

    double absoluteOffsetToViewport = tagOffsetInViewport?.offset;

    if (tagOffsetInViewport == null) {
      return -1;
    } else {
      if (alignment == 0.5) {
        //在视窗中间
        return absoluteOffsetToViewport;
      } else if (alignment == 0) {
        //视窗开始位置
        if (index == sectionIndex) {
          //直接显示sectionHeader，不做处理
          return absoluteOffsetToViewport -
              beginGetter(viewportBoundaryGetter());
        } else {
          return absoluteOffsetToViewport -
              beginGetter(viewportBoundaryGetter());

          ///- _sectionHeight(sectionIndex);
        }
      } else {
        //视窗末尾
        return absoluteOffsetToViewport + endGetter(viewportBoundaryGetter());
      }
    }
  }

  /// return offset, which is a absolute offset to bring the target index object into the center of the viewport
  /// see also: _directionalOffsetToRevealInViewport()
  /// 计算将index带入视图中需要的偏移量值
  RevealedOffset _offsetToRevealInViewport(int index, double alignment) {
    if (tagMap[index] == null) {
      return null;
    }
    final renderBox = tagMap[index];

    final RenderAbstractViewport viewport =
        RenderAbstractViewport.of(renderBox);
    final revealedOffset = viewport.getOffsetToReveal(renderBox, alignment);

    return revealedOffset;
  }
}

class AutoScrollTagInfo {
  final AutoScrollController controller;
  final int index;
  final int section;
  final int row;
  final Widget child;
  final bool disabled;
  AutoScrollTagInfo(this.controller, this.section, this.row, this.index,
      this.child, this.disabled);
}

///
/// 列表空间需要在此控件下
///
class AutoScrollTag extends SingleChildRenderObjectWidget {
  final AutoScrollTagInfo info;

  AutoScrollTag({
    @required this.info,
  }) : super(child: info.child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    RenderBox renderBox = RenderAutoScrollTag(
        scrollable: Scrollable.of(context),
        scrollController: info.controller,
        index: info.index,
        section: info.section,
        row: info.row);
    return renderBox;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderAutoScrollTag renderObject) {
    renderObject
      ..scrollable = Scrollable.of(context)
      ..scrollController = this.info.controller
      ..index = this.info.index;
  }
}

Map<RenderAutoScrollTag, AnimationController> _highlights =
    <RenderAutoScrollTag, AnimationController>{};

class RenderAutoScrollTag extends RenderShiftedBox {
  bool firstCreate = true;
  ScrollableState _scrollable;
  AnimationController _controller;
  AutoScrollController _scrollController;
  int _index;
  int section;
  int row;

  RenderAutoScrollTag(
      {@required ScrollableState scrollable,
      AutoScrollController scrollController,
      int index,
      int section,
      int row,
      RenderBox content})
      : _scrollable = scrollable,
        _scrollController = scrollController,
        _index = index,
        section = section,
        row = row,
        super(content);

  @override
  void performLayout() {
    BoxConstraints exactlyConstraints = constraints.loosen();
    child.layout(exactlyConstraints, parentUsesSize: true);

    double width = max(constraints.minWidth, child.size.width);
    double height = max(constraints.minHeight, child.size.height);
    size = Size(width, height);

    if (row == -1) {
      //section
      _scrollController?.sectionHeightMap[section] = height;
    }
    _scrollController?.itemHeightMap[_index] = ItemPosition(
        index: _index, section: section, row: row, itemHeight: height);
  }

  void positionChild(RenderBox child, Offset offset) {
    final BoxParentData childParentData = child.parentData;
    childParentData.offset = offset;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    register(_index);
    _scrollable.position?.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position?.removeListener(markNeedsLayout);
    _cancelController();
    unregister(_index);
    _controller = null;
    _highlights.remove(this);
    super.detach();
  }

  @override
  bool get isRepaintBoundary => true;

  void register(int index) {
    // the caller in initState() or dispose() is not in the order of first dispose and init
    // so we can't assert there isn't a existing key
    // assert(!widget.controller.tagMap.keys.contains(index));
    _scrollController.tagMap[index] = this;
  }

  void unregister(int index) {
    _cancelController();
    _highlights.remove(this);
    // the caller in initState() or dispose() is not in the order of first dispose and init
    // so we can't assert there isn't a existing key
    // assert(widget.controller.tagMap.keys.contains(index));
    if (_scrollController.tagMap[index] == this)
      _scrollController.tagMap.remove(index);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
  }

  get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    assert(value != null);
    if (_scrollable == value) {
      return;
    }
    final ScrollableState oldValue = _scrollable;
    _scrollable = value;
    markNeedsLayout();
    if (attached) {
      oldValue.position?.removeListener(markNeedsLayout);
    }
  }

  AutoScrollController get scrollController => _scrollController;

  set scrollController(AutoScrollController value) {
    if (_scrollController == value) {
      return;
    }
    _scrollController = value;
    markNeedsLayout();
  }

  get index => _index;

  set index(int value) {
    if (_index == value) {
      return;
    }
    _index = value;
    markNeedsLayout();
  }

  //used to make sure we will drop the old highlight
  //it's rare that we call it more than once in same millisecond, so we just make the time stamp as the unique key
  void _cancelController({bool reset: true}) {
    if (_controller != null) {
      if (_controller.isAnimating) _controller.stop();

      if (reset && _controller.value != 0.0) _controller.value = 0.0;
    }
  }
}
