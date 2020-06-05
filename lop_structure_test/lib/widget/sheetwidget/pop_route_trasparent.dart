import 'package:flutter/material.dart';

typedef DisposeHandler = void Function();

class PopRouteTransparent extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 200);
  Widget child;
  DisposeHandler disposeHandler;

  PopRouteTransparent({@required this.child, this.disposeHandler});

  @override
  void dispose() {
    print('route dispose');
    if (disposeHandler != null){
      disposeHandler();
    }
    super.dispose();
  }

  @override
  Color get barrierColor => Color.fromRGBO(0, 0, 0, 0.4);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}