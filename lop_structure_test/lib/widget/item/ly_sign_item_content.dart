import 'package:flutter/material.dart';
import 'package:lopstructuretest/util/utils.dart';

import 'ITextField.dart';
import 'ly_check_list.dart';
import 'ly_expandable_text.dart';
import 'ly_local_text.dart';
import 'ly_radio_list.dart';

class LySignItemContent extends StatefulWidget {
  final itemData;
  final itemWidth;
  final TextType textType;

  const LySignItemContent({Key key, this.itemData, this.itemWidth, this.textType}) : super(key: key);
  @override
  _LySignItemContentState createState() => _LySignItemContentState();
}

class _LySignItemContentState extends State<LySignItemContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
          text: TextSpan(children: _buildWidgets()),
        ));
  }

  List<InlineSpan> _buildWidgets() {

    List<InlineSpan> widgets = List<InlineSpan>();
    double surWidth = widget.itemWidth;
    for (int i = 0; i < widget.itemData.length; i++) {
      var item = widget.itemData[i];
      if (item["type"] == "text") {
        if (item["lan"] == "zh") {
          String surStr = item["zhText"];
          TextStyle style =
          TextStyle(fontWeight: item["textFont"], color: item["textColor"]);
          double textWidth = Utils.getTextSize(surStr, style).width;
          //超出控件剩余空间
          bool isOverWidth = textWidth > surWidth;
          while (isOverWidth) {
            String fillStr = Utils.splitZhText(surStr, style, surWidth);
            print("fillStr2:${fillStr}");
            widgets.add(WidgetSpan(
                child: LyLocalText(
                    zhText: fillStr,
                    style: style,
                    lineHeight: Utils.getTextSize(surStr, style).height,
                    width: surWidth,
                    textType: TextType.zh)));
            surStr = surStr.substring(fillStr.length, surStr.length);
            double textSurWidth = Utils.getTextSize(surStr, style).width;
            surWidth = widget.itemWidth;
            isOverWidth = textSurWidth > surWidth;
          }
          if (surStr.isNotEmpty) {
            double textSurWidth = Utils.getTextSize(surStr, style).width;
            widgets.add(WidgetSpan(
                child: LyLocalText(
                    zhText: surStr,
                    style: style,
                    lineHeight: Utils.getTextSize(surStr, style).height,
                    width: textSurWidth,
                    textType: TextType.zh)));
            surWidth = surWidth - textSurWidth;
          }
        } else if (item["lan"] == "en") {
          TextStyle style =
          TextStyle(fontWeight: item["textFont"], color: item["textColor"]);
          String surStr = item["enText"];
          double textWidth = Utils.getTextSize(surStr, style).width;
          //超出控件剩余空间
          bool isOverWidth = textWidth > surWidth;
          while (isOverWidth) {
            String fillStr = Utils.splitEnText(surStr, style, surWidth);
            widgets.add(WidgetSpan(
                child: LyLocalText(
                    enText: fillStr,
                    style: style,
                    lineHeight: Utils.getTextSize(surStr, style).height,
                    width: surWidth,
                    textType: TextType.en)));
            surStr = surStr.substring(fillStr.length, surStr.length);
            double textSurWidth = Utils.getTextSize(surStr, style).width;
            surWidth = widget.itemWidth;
            isOverWidth = textSurWidth > surWidth;
          }
          if (surStr.isNotEmpty) {
            double textSurWidth = Utils.getTextSize(surStr, style).width;
            widgets.add(WidgetSpan(
                child: LyLocalText(
                    enText: surStr,
                    style: style,
                    lineHeight: Utils.getTextSize(surStr, style).height,
                    width: textSurWidth,
                    textType: TextType.en)));
            surWidth = surWidth - textSurWidth;
          }
        }
      } else if (item["type"] == "input") {
        widgets.add(WidgetSpan(
            child: Container(
              height: Utils.getTextSize(item["zhText"], TextStyle()).height,
              width: 120,
              child: ITextField(
                inputBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                fieldCallBack: (value) {
                  print("ITextField value:${value}");
                },
                textStyle: TextStyle(color: Colors.green, fontSize: 14),
              ),
            )));
        if (surWidth < 120) {
          surWidth = widget.itemWidth - 120;
        } else if (surWidth == 120) {
          surWidth = widget.itemWidth;
        } else {
          surWidth = surWidth - 120;
        }
      } else if (item["type"] == "image") {
        widgets.add(WidgetSpan(child: Container(width: widget.itemWidth,child: Image.network(item["imageUrl"]),)));
        surWidth = widget.itemWidth;
      } else if (item["type"] == "radio") {
        widgets.add(WidgetSpan(child: Container(width: widget.itemWidth,child: LyRadioList(radios: item["stringList"],callBack: (value){
          print("radio value:${value}");
        },))));
        surWidth = widget.itemWidth;
      }else if (item["type"] == "check") {
        widgets.add(WidgetSpan(child: Container(width: widget.itemWidth,child: LyCheckList(checks: item["stringList"],callBack: (value){
          print("checked value:${value}");
        },))));
        surWidth = widget.itemWidth;
      }else if (item["type"] == "expandabletext") {
        widgets.add(WidgetSpan(child: LyExpandableText(item["text"],expandText: "更多",collapseText: "收起",maxLines: 1,linkColor: Colors.blue,)));
        surWidth = widget.itemWidth;
      }
    }
    return widgets;
  }
}
