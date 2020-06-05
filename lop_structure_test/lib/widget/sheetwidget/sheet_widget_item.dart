import 'package:flutter/material.dart';
import 'package:lopstructuretest/widget/sheetwidget/sheet_widget.dart';
import 'package:provider/provider.dart';

typedef onTapGesture = void Function();

class SheetWidgetItem extends StatefulWidget {
  final String title;
  final Color textColor;
  final onTapGesture onTap;
  final isCancel = false;
  final bool canResponseTap;
  final double specificFontSize;

  SheetWidgetItem(this.title, this.onTap,
      {this.textColor,
      isCancel,
      this.canResponseTap = true,
      this.specificFontSize});

  @override
  _SheetWidgetItemState createState() => _SheetWidgetItemState();
}

class _SheetWidgetItemState extends State<SheetWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<double, int, SheetWidgetPublicState>(
      builder: (context, fontSize, itemHeight, pubState, child) {
        return Material(
            child: Ink(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    pubState.hideSheet(sheetItem: widget);
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: itemHeight.toDouble(),
                    child: Center(
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          fontSize: widget.specificFontSize ?? fontSize,
                        ),
                      ),
                    ),
                  ),
                )));
      },
    );
  }
}
