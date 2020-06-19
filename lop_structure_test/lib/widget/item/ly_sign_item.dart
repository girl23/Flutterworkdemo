import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lopstructuretest/util/utils.dart';
import 'package:lopstructuretest/widget/item/ITextField.dart';
import 'package:lopstructuretest/widget/item/ly_check_list.dart';
import 'package:lopstructuretest/widget/item/ly_expandable_text.dart';
import 'package:lopstructuretest/widget/item/ly_local_text.dart';
import 'package:lopstructuretest/widget/item/ly_radio_list.dart';
import 'package:lopstructuretest/widget/item/ly_sign_item_content.dart';
import 'package:lopstructuretest/widget/item/ly_sign_item_content1.dart';
import 'package:lopstructuretest/widget/item/ly_sign_item_header.dart';

class LySignItem extends StatefulWidget {
  final itemData;
  final itemWidth;
  final TextType textType;
  LySignItem(this.itemData, this.itemWidth, this.textType);
  @override
  _LySignItemState createState() => _LySignItemState();
}

class _LySignItemState extends State<LySignItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          LySignItemHeader(itemData: widget.itemData,width: widget.itemWidth),
          LySignItemContent(itemData:widget.itemData["datas"],itemWidth:widget.itemWidth, textType:widget.textType),
          SizedBox(
            height: 3,
            width: widget.itemWidth,
            child: Container(),
          ),
          Divider(height: 1,color: Colors.black26,),
          SizedBox(
            height: 3,
            width: widget.itemWidth,
            child: Container(),
          )
        ],
    );
  }


}
