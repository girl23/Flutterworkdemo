//圆圈工具类
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
class CirclePainter extends CustomPainter {
  List <Color>colors;
  List <double>percent;
  ///[定义画笔]
  Paint _paint1;
  bool _filled = false;
  double _startAngle;
  Offset _center;
  double _radius;

  CirclePainter(this.colors,this.percent,{ bool filled=false, double strokeWidth=15.0,double startAngle=pi/2,Offset center=const Offset(150.0,150.0),double radius=100}){
    _paint1= Paint()
      ..strokeCap = StrokeCap.butt//画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
      ..style =(filled)?PaintingStyle.fill:PaintingStyle.stroke //绘画风格，默认为填充PaintStyle.stroke 不填充,PaintingStyle.fill 填充
      ..strokeWidth = strokeWidth; //画笔的宽度
    _filled=filled;
    _startAngle=startAngle;
    _center=center;
    _radius=radius;
  }
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect2 = Rect.fromCircle(center: _center, radius: _radius);
    //    根据定义，一周的弧度数为2πr/r=2π，360°角=2π弧度，因此，1弧度约为57.3°，即57°17’44.806’’，
//    1°为π/180弧度，近似值为0.01745弧度，周角为2π弧度，平角（即180°角）为π弧度，直角为π/2弧度。
    //rect2矩型区域，起始点，化的幅度，是否连接中心原点
    //将360平均分层100分*乘以每一份占的弧度，再乘以100份中占了多少份
      double completeAngle=0.0;
     for (int i=0;i<colors.length;i++){
       double angle=(360.0/100.0)*pi/180*percent[i];
       Color drawColor=colors[i];
       _paint1.color=drawColor;
       canvas.drawArc(rect2,_startAngle+completeAngle , angle, _filled?true:false, _paint1);
       completeAngle+=angle;
     }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
//    在这个函数中，你应该返回true或false。如果你的绘画依赖于一个变量并且该变量发生了变化，那么你在这里返回true，
//    这样Flutter就知道它必须调用paint方法来重绘你的绘画。否则，在此处返回false表示您不需要重绘。
    if (oldDelegate is CirclePainter) {
      return oldDelegate.colors != colors || oldDelegate.percent != percent ||
          oldDelegate._paint1 != _paint1 || oldDelegate._filled != _filled ||
          oldDelegate._startAngle != _startAngle || oldDelegate._center != _center ||
          oldDelegate._radius != _radius;
    }
    return false;
  }
}