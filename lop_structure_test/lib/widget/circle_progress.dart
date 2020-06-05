import 'package:flutter/material.dart';
import 'paint_circle.dart';
import 'dart:math';
class CircleProgress extends StatelessWidget {
 final List <Color>colors;
 final List <double>percent;
 final bool filled;
 final double strokeWidth;
 final double startAngle;
 final Offset center;
 final double radius;
 CircleProgress(this.colors,this.percent,{this.filled=false, this.strokeWidth=15.0,this.startAngle=pi/2,this.center=const Offset(150.0,150.0),this.radius=100}); //
  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
          size: Size(100,100),
          painter:CirclePainter(colors, percent,center: this.center,filled: this.filled,strokeWidth: this.strokeWidth,startAngle: this.startAngle,radius: this.radius),
    );
  }
}
