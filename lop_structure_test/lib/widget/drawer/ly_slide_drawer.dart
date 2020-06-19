/*
参考: https://github.com/akshathjain/sliding_up_panel/blob/master/LICENSE
*/
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/physics.dart';

enum SlideDirection {
  LEFT,
  RIGHT,
}

enum DrawerState { OPEN, CLOSED }

class LySlideDrawer extends StatefulWidget {
  final Widget Function(ScrollController sc) panelBuilder;
  final Widget body;
  final Widget header;
  final Widget footer;
  final double minWidth;
  final double maxWidth;
  final double headHeight;
  final double footerHeight;
  final double snapPoint;
  final Border border;
  final double appbarSize;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool renderPanelSheet;
  final bool panelSnapping;
  final PanelController controller;
  final bool backdropEnabled;
  final Color backdropColor;
  final double backdropOpacity;
  final bool backdropTapClosesPanel;
  final void Function(double position) onPanelSlide;
  final VoidCallback onPanelOpened;
  final VoidCallback onPanelClosed;
  final bool parallaxEnabled;
  final double parallaxOffset;
  final bool isDraggable;
  final bool defaultPadding;
  final SlideDirection slideDirection;
  final DrawerState defaultPanelState;

  LySlideDrawer(
      {Key key,
      this.panelBuilder,
      this.body,
        this.headHeight = 0,
        this.footerHeight = 0,
      this.minWidth = 100.0,
      this.maxWidth = 500.0,
      this.snapPoint,
      this.border,
        this.appbarSize,
      this.borderRadius,
      this.defaultPadding = false,
      this.boxShadow = const <BoxShadow>[
        BoxShadow(
          blurRadius: 8.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
        )
      ],
      this.color = Colors.white,
      this.padding,
      this.margin,
      this.renderPanelSheet = true,
      this.panelSnapping = true,
      this.controller,
      this.backdropEnabled = false,
      this.backdropColor = Colors.black,
      this.backdropOpacity = 0.5,
      this.backdropTapClosesPanel = true,
      this.onPanelSlide,
      this.onPanelOpened,
      this.onPanelClosed,
      this.parallaxEnabled = false,
      this.parallaxOffset = 1,
      this.isDraggable = true,
      this.slideDirection = SlideDirection.LEFT,
      this.defaultPanelState = DrawerState.CLOSED,
      this.header,
      this.footer})
      : assert(panelBuilder != null),
        assert(0 <= backdropOpacity && backdropOpacity <= 1.0),
        assert(snapPoint == null || 0 < snapPoint && snapPoint < 1.0),
        super(key: key);

  @override
  _LySlideDrawerState createState() => _LySlideDrawerState();
}

class _LySlideDrawerState extends State<LySlideDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _ac;
  ScrollController _sc;
  bool _scrollingEnabled = false;
  VelocityTracker _vt = new VelocityTracker();
  bool _isPanelVisible = true;
  BouncingScrollPhysics _scrollPhysics;
  @override
  void initState() {
    super.initState();
    _ac = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 150),
        value: widget.defaultPanelState == DrawerState.CLOSED
            ? 0.0
            : 1.0 //set the default panel state (i.e. set initial value of _ac)
        )
      ..addListener(() {
        if (widget.onPanelSlide != null) widget.onPanelSlide(_ac.value);
        if (widget.onPanelOpened != null && _ac.value == 1.0)
          widget.onPanelOpened();
        if (widget.onPanelClosed != null && _ac.value == 0.0)
          widget.onPanelClosed();
      });
    _sc = new ScrollController();
    _sc.addListener(() {
      if (widget.isDraggable && !_scrollingEnabled) _sc.jumpTo(0);
    });
    widget.controller?._addState(this);
    _scrollPhysics = BouncingScrollPhysics();
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      _initSlideMax(widget.slideDirection == SlideDirection.LEFT
          ? (widget.maxWidth - widget.minWidth)
          : -(widget.maxWidth - widget.minWidth));
    });
    //_statusHeight = MediaQueryData.fromWindow(window).padding.top;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Stack(
      alignment: widget.slideDirection == SlideDirection.LEFT
          ? Alignment.centerRight
          : Alignment.centerLeft,
      children: <Widget>[
        //make the back widget take up the entire back side
        widget.body != null
            ? AnimatedBuilder(
          animation: _ac,
          builder: (context, child) {
            return Positioned(
//                    top: widget.appbarSize,
              right: widget.slideDirection == SlideDirection.LEFT
                  ? widget.parallaxEnabled
                  ? _getParallax()
                  : widget.defaultPadding ? widget.minWidth : 0.0
                  : null,
              left: widget.slideDirection == SlideDirection.RIGHT
                  ? widget.parallaxEnabled
                  ? _getParallax()
                  : widget.defaultPadding ? widget.minWidth : 0.0
                  : null,
              child: GestureDetector(
                onTap: () async {
                  if(_ac.value == 1.0){
                    _close();
                  }else{
                    _open();
                  }
                },
                child: child,
              ),
            );
          },
          child: Padding(
            padding: widget.padding,
            child: Container(
              height: MediaQuery.of(context).size.height - widget.appbarSize-MediaQueryData.fromWindow(window).padding.top,
              width: MediaQuery.of(context).size.width,
              child: widget.body,
            ),
          ),
        )
            : Container(),
        !widget.backdropEnabled
            ? Container()
            : GestureDetector(
          onVerticalDragEnd: widget.backdropTapClosesPanel
              ? (DragEndDetails dets) {
            // only trigger a close if the drag is towards panel close position
            if ((widget.slideDirection == SlideDirection.RIGHT
                ? 1
                : -1) *
                dets.velocity.pixelsPerSecond.dx >
                0) _close();
          }
              : null,
          onTap: widget.backdropTapClosesPanel ? () => _close() : null,
          child: AnimatedBuilder(
              animation: _ac,
              builder: (context, _) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  //set color to null so that touch events pass through
                  //to the body when the panel is closed, otherwise,
                  //if a color exists, then touch events won't go through
                  color: _ac.value == 0.0
                      ? null
                      : widget.backdropColor.withOpacity(
                      widget.backdropOpacity * _ac.value),
                );
              }),
        ),
        //the actual sliding part
        !_isPanelVisible
            ? Container()
            : _gestureHandler(
          child: AnimatedBuilder(
            animation: _ac,
            child: Column(
              children: <Widget>[
                // header
                widget.header ?? Container(),
                Container(
                  height: MediaQuery.of(context).size.height-widget.headHeight-widget.footerHeight-widget.appbarSize-MediaQueryData.fromWindow(window).padding.top,
                  width: widget.maxWidth,
                  child: widget.panelBuilder(_sc),
                ),
                // footer
                widget.footer ?? Container()
              ],
            ),
            builder: (context, child) {
              return RepaintBoundary(
                child: Transform.translate(
                  offset: Offset(_getDx(_ac), 0),
                  child: Container(
                      width: widget.maxWidth,
                      margin: widget.margin,
                      padding: widget.padding,
                      decoration: widget.renderPanelSheet
                          ? BoxDecoration(
                        border: widget.border,
                        borderRadius: widget.borderRadius,
                        boxShadow: widget.boxShadow,
                        color: widget.color,
                      )
                          : null,
                      child: child),
                ),
              );
            },
          ),
        ),
      ],
    ),);
  }

  double _getDx(AnimationController ac) {
    if (widget.slideDirection == SlideDirection.LEFT) {
      return _ac.value * (widget.maxWidth - widget.minWidth);
    } else {
      return -_ac.value * (widget.maxWidth - widget.minWidth);
    }
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  double _getParallax() {
    if (widget.slideDirection == SlideDirection.LEFT)
      return (-_ac.value + 1) *
              (widget.maxWidth - widget.minWidth) *
              widget.parallaxOffset +
          widget.minWidth;
    else
      return (-_ac.value + 1) *
              (widget.maxWidth - widget.minWidth) *
              widget.parallaxOffset +
          widget.minWidth;
  }

  // returns a gesture detector if panel is used
  // and a listener if panelBuilder is used.
  // this is because the listener is designed only for use with linking the scrolling of
  // panels and using it for panels that don't want to linked scrolling yields odd results
  Widget _gestureHandler({Widget child}) {
    if (!widget.isDraggable) return child;
    
    return Listener(
      onPointerDown: (PointerDownEvent p) =>
          _vt.addPosition(p.timeStamp, p.position),
      onPointerMove: (PointerMoveEvent p) {
        _vt.addPosition(p.timeStamp,
            p.position); // add current position for velocity tracking
        _onGestureSlide(p.delta.dx, p.delta.dy);
      },
      onPointerUp: (PointerUpEvent p) => _onGestureEnd(_vt.getVelocity()),
      child: child,
    );
  }

  void _initSlideMax(double dx) {
    if (widget.slideDirection == SlideDirection.RIGHT)
      _ac.value -= dx / (widget.maxWidth - widget.minWidth);
    else
      _ac.value += dx / (widget.maxWidth - widget.minWidth);
  }

  // handles the sliding gesture
  void _onGestureSlide(double dx, double dy) {
    if (!widget.isDraggable) return;
    if (widget.slideDirection == SlideDirection.LEFT ||
        widget.slideDirection == SlideDirection.RIGHT) {
      ///抽屉方向为左右的时候
      if (dx.abs() > dy.abs()) {
        if (!_scrollingEnabled) {
          if (widget.slideDirection == SlideDirection.RIGHT)
            _ac.value -= dx / (widget.maxWidth - widget.minWidth);
          else
            _ac.value += dx / (widget.maxWidth - widget.minWidth);
        }
        // if the panel is open and the user hasn't scrolled, we need to determine
        // whether to enable scrolling if the user swipes up, or disable closing and
        // begin to close the panel if the user swipes down
        if (_isPanelOpen && _sc.hasClients && _sc.offset <= 0) {
          setState(() {
            if (dx < 0) {
              _scrollingEnabled = true;
            } else {
              _scrollingEnabled = false;
            }
          });
        }
      }
    } else {
      ///
    }
  }

  // handles when user stops sliding
  void _onGestureEnd(Velocity v) {
    if (!widget.isDraggable) return;
    double minFlingVelocity = 365.0;
    double kSnap = 8;

    //let the current animation finish before starting a new one
    if (_ac.isAnimating) return;

    // if scrolling is allowed and the panel is open, we don't want to close
    // the panel if they swipe up on the scrollable
    if (_isPanelOpen && _scrollingEnabled) return;

    //check if the velocity is sufficient to constitute fling to end
    double visualVelocity =
        -v.pixelsPerSecond.dx / (widget.maxWidth - widget.minWidth);

    // reverse visual velocity to account for slide direction
    if (widget.slideDirection == SlideDirection.LEFT)
      visualVelocity = -visualVelocity;

    // get minimum distances to figure out where the panel is at
    double d2Close = _ac.value;
    double d2Open = 1 - _ac.value;
    double d2Snap = ((widget.snapPoint ?? 3) - _ac.value)
        .abs(); // large value if null results in not every being the min
    double minDistance = min(d2Close, min(d2Snap, d2Open));

    // check if velocity is sufficient for a fling
    if (v.pixelsPerSecond.dx.abs() >= minFlingVelocity) {
      // snapPoint exists
      if (widget.panelSnapping && widget.snapPoint != null) {
        if (v.pixelsPerSecond.dy.abs() >= kSnap * minFlingVelocity ||
            minDistance == d2Snap)
          _ac.fling(velocity: visualVelocity);
        else
          _flingPanelToPosition(widget.snapPoint, visualVelocity);

        // no snap point exists
      } else if (widget.panelSnapping) {
        _ac.fling(velocity: visualVelocity);

        // panel snapping disabled
      } else {
        _ac.animateTo(
          _ac.value + visualVelocity * 0.16,
          duration: Duration(milliseconds: 410),
          curve: Curves.decelerate,
        );
      }

      return;
    }

    // check if the controller is already halfway there
    if (widget.panelSnapping) {
      if (minDistance == d2Close) {
        _close();
      } else if (minDistance == d2Snap) {
        _flingPanelToPosition(widget.snapPoint, visualVelocity);
      } else {
        _open();
      }
    }
  }

  void _flingPanelToPosition(double targetPos, double velocity) {
    final Simulation simulation = SpringSimulation(
        SpringDescription.withDampingRatio(
          mass: 1.0,
          stiffness: 500.0,
          ratio: 1.0,
        ),
        _ac.value,
        targetPos,
        velocity);

    _ac.animateWith(simulation);
  }

  //---------------------------------
  //PanelController related functions
  //---------------------------------

  //close the panel
  Future<void> _close() {
    return _ac.fling(velocity: -1.0);
  }

  //open the panel
  Future<void> _open() {
    return _ac.fling(velocity: 1.0);
  }

  //hide the panel (completely offscreen)
  Future<void> _hide() {
    return _ac.fling(velocity: -1.0).then((x) {
      setState(() {
        _isPanelVisible = false;
      });
    });
  }

  //show the panel (in collapsed mode)
  Future<void> _show() {
    return _ac.fling(velocity: -1.0).then((x) {
      setState(() {
        _isPanelVisible = true;
      });
    });
  }

  //animate the panel position to value - must
  //be between 0.0 and 1.0
  Future<void> _animatePanelToPosition(double value,
      {Duration duration, Curve curve = Curves.linear}) {
    assert(0.0 <= value && value <= 1.0);
    return _ac.animateTo(value, duration: duration, curve: curve);
  }

  //animate the panel position to the snap point
  //REQUIRES that widget.snapPoint != null
  Future<void> _animatePanelToSnapPoint(
      {Duration duration, Curve curve = Curves.linear}) {
    assert(widget.snapPoint != null);
    return _ac.animateTo(widget.snapPoint, duration: duration, curve: curve);
  }

  //set the panel position to value - must
  //be between 0.0 and 1.0
  set _panelPosition(double value) {
    assert(0.0 <= value && value <= 1.0);
    _ac.value = value;
  }

  //get the current panel position
  //returns the % offset from collapsed state
  //as a decimal between 0.0 and 1.0
  double get _panelPosition => _ac.value;

  //returns whether or not
  //the panel is still animating
  bool get _isPanelAnimating => _ac.isAnimating;

  //returns whether or not the
  //panel is open
  bool get _isPanelOpen => _ac.value == 1.0;

  //returns whether or not the
  //panel is closed
  bool get _isPanelClosed => _ac.value == 0.0;

  //returns whether or not the
  //panel is shown/hidden
  bool get _isPanelShown => _isPanelVisible;
}

class PanelController {
  _LySlideDrawerState _panelState;

  void _addState(_LySlideDrawerState panelState) {
    this._panelState = panelState;
  }

  /// Determine if the panelController is attached to an instance
  /// of the SlidingUpPanel (this property must return true before any other
  /// functions can be used)
  bool get isAttached => _panelState != null;

  /// Closes the sliding panel to its collapsed state (i.e. to the  minHeight)
  Future<void> close() {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._close();
  }

  /// Opens the sliding panel fully
  /// (i.e. to the maxHeight)
  Future<void> open() {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._open();
  }

  /// Hides the sliding panel (i.e. is invisible)
  Future<void> hide() {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._hide();
  }

  /// Shows the sliding panel in its collapsed state
  /// (i.e. "un-hide" the sliding panel)
  Future<void> show() {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._show();
  }

  /// Animates the panel position to the value.
  /// The value must between 0.0 and 1.0
  /// where 0.0 is fully collapsed and 1.0 is completely open.
  /// (optional) duration specifies the time for the animation to complete
  /// (optional) curve specifies the easing behavior of the animation.
  Future<void> animatePanelToPosition(double value,
      {Duration duration, Curve curve = Curves.linear}) {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    assert(0.0 <= value && value <= 1.0);
    return _panelState._animatePanelToPosition(value,
        duration: duration, curve: curve);
  }

  /// Animates the panel position to the snap point
  /// Requires that the SlidingUpPanel snapPoint property is not null
  /// (optional) duration specifies the time for the animation to complete
  /// (optional) curve specifies the easing behavior of the animation.
  Future<void> animatePanelToSnapPoint(
      {Duration duration, Curve curve = Curves.linear}) {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    assert(_panelState.widget.snapPoint != null,
        "SlidingUpPanel snapPoint property must not be null");
    return _panelState._animatePanelToSnapPoint(
        duration: duration, curve: curve);
  }

  /// Sets the panel position (without animation).
  /// The value must between 0.0 and 1.0
  /// where 0.0 is fully collapsed and 1.0 is completely open.
  set panelPosition(double value) {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    assert(0.0 <= value && value <= 1.0);
    _panelState._panelPosition = value;
  }

  /// Gets the current panel position.
  /// Returns the % offset from collapsed state
  /// to the open state
  /// as a decimal between 0.0 and 1.0
  /// where 0.0 is fully collapsed and
  /// 1.0 is full open.
  double get panelPosition {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._panelPosition;
  }

  /// Returns whether or not the panel is
  /// currently animating.
  bool get isPanelAnimating {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._isPanelAnimating;
  }

  /// Returns whether or not the
  /// panel is open.
  bool get isPanelOpen {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._isPanelOpen;
  }

  /// Returns whether or not the
  /// panel is closed.
  bool get isPanelClosed {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._isPanelClosed;
  }

  /// Returns whether or not the
  /// panel is shown/hidden.
  bool get isPanelShown {
    assert(isAttached, "PanelController must be attached to a SlidingUpPanel");
    return _panelState._isPanelShown;
  }
}
