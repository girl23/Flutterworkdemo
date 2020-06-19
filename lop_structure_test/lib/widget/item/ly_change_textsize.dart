import 'package:flutter/material.dart';
import 'package:lopstructuretest/provider/sign_item_provider.dart';
import 'package:lopstructuretest/widget/slider/radio/radio_slider.dart';
import 'package:provider/provider.dart';

class LyChangeTextSize extends StatefulWidget {
  @override
  _LyChangeTextSizeState createState() => _LyChangeTextSizeState();
}

class _LyChangeTextSizeState extends State<LyChangeTextSize> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SingItemProvider>(builder: (context, provider, child) {
      return Column(
        children: <Widget>[
          Text("字体大小：${provider.textSize}"),
          Row(
            children: <Widget>[
              Text("16"),
              SliderTheme(
                data: SliderThemeData(
                    trackHeight: 3,
                    activeTickMarkColor: Colors.lightGreen,
                    activeTrackColor: Colors.blue,
                    inactiveTrackColor: Colors.blue,
                    inactiveTickMarkColor: Colors.blue
                ),
                child: RadioSlider(
                  onChanged: (value) {
//                    Future.delayed(Duration(milliseconds: 200)).then((_){
                      provider.textSize = value;
//                    });
                  },
                  min: 16.0,
                  max: 22.0,
                  thumbWidth: 8.0,
                  thumbOutWidth: 8.0,
                  tickMarkWidth: 8.0,
                  tickMarkOutWidth: 10.0,
                  value: provider.textSize,
                  divisions: 3,

                  outerCircle: false,
                ),
              ),
              Text("22"),
            ],
          )
        ],
      );
    });
  }
}
