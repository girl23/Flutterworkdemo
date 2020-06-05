import 'package:flutter/material.dart';

enum TextType{
  zh,
  en,
  all
}

class LyLocalText extends StatefulWidget {
  final String zhText;
  final String enText;
  final TextStyle style;
  final lineHeight;
  final width;
  final TextType textType;
  LyLocalText({this.zhText,this.enText,this.style,this.lineHeight,this.width,this.textType});
  @override
  _LyLocalTextState createState() => _LyLocalTextState();
}

class _LyLocalTextState extends State<LyLocalText> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _ChapterTextPainter(
            zhText: widget.zhText,
            enText: widget.enText,
            style: widget.style,
            textType: widget.textType
        ),
        size: Size(widget.width,widget.textType == TextType.all?widget.lineHeight * 2:widget.lineHeight),
      );
  }
}
class _ChapterTextPainter extends CustomPainter{

  final String zhText;
  final String enText;
  final TextStyle style;
  final TextType textType;
  _ChapterTextPainter({this.zhText,this.enText,this.style,this.textType});


  @override
  void paint(Canvas canvas, Size size) {
//    _drawBg(canvas, size);
    if(textType == TextType.zh){
      _drawZh(canvas);
    }else if(textType == TextType.en){
      _drawEn(canvas);
    }else if(textType == TextType.all){
      _drawAll(canvas);
    }

  }
  _drawBg(Canvas canvas,Size size) {
    Paint paint = new Paint();
    paint..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }
  ///画中文
  void _drawZh(Canvas canvas){
    TextSpan zhSpan = TextSpan(style: style, text: zhText);
    TextPainter zhTp = TextPainter(text: zhSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    zhTp.layout();
    zhTp.paint(canvas, Offset(0,0));
  }
  ///画英文
  void _drawEn(Canvas canvas){
    TextSpan enSpan = TextSpan(style: style, text:enText);
    TextPainter enTp = TextPainter(text: enSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    enTp.layout();
    enTp.paint(canvas, Offset(0,0));
  }
  ///画中英文
  void _drawAll(Canvas canvas){
    if(zhText.isNotEmpty && enText.isNotEmpty){
      double yOffset = 0;
      TextSpan zhSpan = TextSpan(style: style, text: zhText);
      TextPainter zhTp = TextPainter(text: zhSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      zhTp.layout();
      yOffset = zhTp.size.height;
      zhTp.paint(canvas, Offset(0,0));
      TextSpan enSpan = TextSpan(style: style, text:enText);
      TextPainter enTp = TextPainter(text: enSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      enTp.layout();
      enTp.paint(canvas, Offset(0,yOffset));
    }else if(enText.isEmpty && zhText.isNotEmpty){
      _drawZh(canvas);
    }else if(zhText.isEmpty && enText.isNotEmpty){
      _drawEn(canvas);
    }

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    if (oldDelegate is _ChapterTextPainter) {
      return oldDelegate.zhText != zhText || oldDelegate.enText != enText || oldDelegate.style.color.value != style.color.value;
    }
    return false;
  }

}