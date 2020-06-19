import 'package:flutter/material.dart';

class Utils{
  static Size getTextSize(text,textStyle){
    TextSpan span = new TextSpan(style: textStyle, text: text);
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    return tp.size;
  }
  ///将text按照显示宽度截取
  static String splitZhText(text,textStyle,width){

    StringBuffer splitText = StringBuffer();
    var allChart = text.split('');
    double xOffset = 0.0;
    for (int i = 0; i < allChart.length; i++) {
      var char = allChart[i];
      TextSpan span = new TextSpan(style: textStyle, text: char);
      TextPainter tp = new TextPainter(text: span,textAlign: TextAlign.left,textDirection: TextDirection.ltr);
      tp.layout();
      if ((xOffset + tp.size.width) >= width) {
        xOffset = 0.0;
        return splitText.toString();
      }
      splitText.write(char);
      xOffset += 1 * tp.size.width;
    }
    return "";
  }
  ///将text按照显示宽度截取
  static String splitEnText(text,textStyle,width){
    StringBuffer splitText = StringBuffer();
    Map<String,double> alphabet = Map();
    var allChart = text.split('');
    double xOffset = 0.0;
    int i=0;
    for (;i < allChart.length; i++) {
      var char = allChart[i];
      double tempWidth = 0.0;
      if(alphabet.containsKey(char)){
        tempWidth = alphabet[char];
      }else{
        TextSpan span = new TextSpan(style: textStyle, text: char);
        TextPainter tp = new TextPainter(text: span,textAlign: TextAlign.left,textDirection: TextDirection.ltr);
        tp.layout();
        tempWidth = tp.size.width;
        alphabet[char] = tempWidth;
      }

      if ((xOffset + tempWidth) >= width) {
        xOffset = 0.0;
        break;
      }
      xOffset += 1 * tempWidth;
    }
    int j = i;
    for(;j>0;j--){
      var char = allChart[j];
      if(char ==' '){
        break;
      }
    }
    for(int k = 0;k<=j;k++){
      var char = allChart[k];
      splitText.write(char);
    }
    return splitText.toString();
  }
}