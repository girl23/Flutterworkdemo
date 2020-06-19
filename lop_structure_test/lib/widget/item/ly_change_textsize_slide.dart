import 'package:flutter/material.dart';
import 'package:lopstructuretest/provider/sign_item_provider.dart';
import 'package:provider/provider.dart';

class LyChangeTextSizeSlide extends StatefulWidget {
  @override
  _LyChangeTextSizeSlideState createState() => _LyChangeTextSizeSlideState();
}

class _LyChangeTextSizeSlideState extends State<LyChangeTextSizeSlide> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SingItemProvider>(builder: (context, provider, child) {
      return Listener(
          onPointerDown: (PointerDownEvent p) {
            provider.drawerisDragable = false;
          },
          onPointerMove: (PointerMoveEvent p) {
            provider.drawerisDragable = false;
          },
          onPointerUp: (PointerUpEvent p) {
            provider.drawerisDragable = true;
          },
          child: Row(
            children: <Widget>[
              Text("16"),
              SliderTheme(
                  data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
                  ),
                  child: Slider(
                    min: 16.0,
                    max: 22.0,
                    value: provider.textSize,
                    onChanged: (value) {
//                      Future.delayed(Duration(milliseconds: 400)).then((_){
                        provider.textSize = value;
//                      });

                    },
                    divisions: 60,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.black26,
                  )),
              Text("22"),
            ],
          ));
    });
  }
}
