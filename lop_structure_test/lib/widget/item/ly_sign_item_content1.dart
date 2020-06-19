import 'package:flutter/material.dart';
import 'package:lopstructuretest/provider/sign_item_provider.dart';
import 'package:lopstructuretest/util/utils.dart';
import 'package:provider/provider.dart';

import 'ITextField.dart';
import 'ly_check_list.dart';
import 'ly_expandable_text.dart';
import 'ly_local_text.dart';
import 'ly_radio_list.dart';

class LySignItemContent1 extends StatefulWidget {
  final itemData;
  final itemWidth;
  final TextType textType;

  const LySignItemContent1(
      {Key key, this.itemData, this.itemWidth, this.textType})
      : super(key: key);

  @override
  _LySignItemContentState1 createState() => _LySignItemContentState1();
}

class _LySignItemContentState1 extends State<LySignItemContent1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SingItemProvider>(builder: (context, provider, child) {
      return Center(
          child: RichText(
            text: TextSpan(children: _buildWidgets(provider)),
          ));
    });
  }

  List<InlineSpan> _buildWidgets(provider) {
    List<InlineSpan> widgets = List<InlineSpan>();
    double surWidth = widget.itemWidth;
    for (int i = 0; i < widget.itemData.length; i++) {
      var item = widget.itemData[i];
      var label = item["label"];
      if("p" == label){
        TextStyle style = TextStyle(fontWeight: item["textFont"], color: item["textColor"],fontSize: provider.textSize);
        var contents = item["content"];
        StringBuffer stringBuffer = StringBuffer();
        for(int i=0;i<contents.length;i++){
          var content = contents[i];
          var type = content["type"];
          if("text" == type){
            stringBuffer.write(content["text"]);
          }else if("input" == type){
            stringBuffer.write("        ");
          }
        }
        widgets.add(WidgetSpan(
            child: Container(
                width: widget.itemWidth,
                child: Stack(
                  children: <Widget>[
                    Text(stringBuffer.toString(),style: style,)
                  ],
                ))));
        surWidth = widget.itemWidth;
      } else if ("image" == label) {
        widgets.add(WidgetSpan(
            child: Container(
              width: widget.itemWidth,
              child: Image.network(item["content"]["imageUrl"]),
            )));
        surWidth = widget.itemWidth;
      } else if ("radio" == label) {
        widgets.add(WidgetSpan(
            child: Container(
                width: widget.itemWidth,
                child: LyRadioList(
                  radios: item["content"]["stringList"],
                  callBack: (value) {
                    print("radio value:${value}");
                  },
                ))));
        surWidth = widget.itemWidth;
      } else if ("check" == label) {
        widgets.add(WidgetSpan(
            child: Container(
                width: widget.itemWidth,
                child: LyCheckList(
                  checks: item["content"]["stringList"],
                  callBack: (value) {
                    print("checked value:${value}");
                  },
                ))));
        surWidth = widget.itemWidth;
      } else if ("expandable" == label) {
        widgets.add(WidgetSpan(
            child: LyExpandableText(
              item["content"]["text"],
              expandText: "更多",
              collapseText: "收起",
              maxLines: 1,
              linkColor: Colors.blue,
            )));
        surWidth = widget.itemWidth;
      }
    }
    return widgets;
  }
}
