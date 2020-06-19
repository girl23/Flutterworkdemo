import 'package:flutter/material.dart';

enum RadioSliderOrientation {
  Vertical,
  Horizontal,
}

class RadioSliderThumbShape extends SliderComponentShape {
  bool outerCircle;
  Color activeColor;
  double width;
  double outWidth;
  RadioSliderThumbShape({this.outerCircle = true, this.activeColor,this.width = 10,this.outWidth = 10});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(width);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation, Animation<double> enableAnimation,
        bool isDiscrete, TextPainter labelPainter, RenderBox parentBox,
        SliderThemeData sliderTheme, TextDirection textDirection,
        double value}) {
    var outerValueStyle = Paint()
      ..color = this.activeColor ?? sliderTheme.activeTickMarkColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    var innerValueStyle = Paint()
      ..color = this.activeColor ?? sliderTheme.activeTickMarkColor
      ..style = PaintingStyle.fill;

    // paint the optional outer circle
    if (outerCircle == true) {
      context.canvas.drawCircle(center, width+3, outerValueStyle);
    }

    // paint the inner circle
    context.canvas.drawCircle(center, width, innerValueStyle);
  }
}

class RadioSliderTickMarkShape extends SliderTickMarkShape {
  double width;
  double outWidth;
  RadioSliderTickMarkShape({this.width = 10,this.outWidth = 10});

  @override
  Size getPreferredSize({SliderThemeData sliderTheme, bool isEnabled}) {
    return Size.fromRadius(0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {RenderBox parentBox, SliderThemeData sliderTheme,
        Animation<double> enableAnimation, Offset thumbCenter, bool isEnabled,
        TextDirection textDirection}) {
    var innerStyle = Paint()
      ..color = sliderTheme.inactiveTickMarkColor
      ..style = PaintingStyle.fill;

    var outerStyle = Paint()
      ..color = sliderTheme.inactiveTrackColor
      ..style = PaintingStyle.fill;

    // outer circle
    context.canvas.drawCircle(center, outWidth, outerStyle);

    // inner circle
    context.canvas.drawCircle(center, width, innerStyle);
  }
}

class RadioSlider extends StatefulWidget {
  final int divisions;
  final bool outerCircle;
  final double value;
  final RadioSliderOrientation orientation;
  final ValueChanged<double> onChanged;
  final Color activeColor;
  final thumbWidth;
  final thumbOutWidth;
  final tickMarkWidth;
  final tickMarkOutWidth;
  final double min;
  final double max;
  final String label;
  const RadioSlider({
    Key key,
    @required this.min,
    @required this.max,
    this.divisions = 1,
    this.outerCircle = true,
    this.value = 0,
    this.label,
    this.thumbWidth = 10,
    this.thumbOutWidth = 10,
    this.tickMarkWidth = 10,
    this.tickMarkOutWidth = 10,
    this.orientation = RadioSliderOrientation.Horizontal,
    @required this.onChanged,
    this.activeColor,
  }) : assert(divisions >= 1),
       super(key: key);

  @override
  _RadioSliderState createState() => _RadioSliderState();
}

class _RadioSliderState extends State<RadioSlider> {
  num _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  Widget _buildRadioSlider(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        tickMarkShape: RadioSliderTickMarkShape(width: widget.tickMarkWidth,outWidth: widget.tickMarkOutWidth),
        thumbShape: RadioSliderThumbShape(
          activeColor: widget.activeColor,
          outerCircle: widget.outerCircle,
          width: widget.thumbWidth,
            outWidth: widget.thumbOutWidth
        ),
      ),
      child: Slider(

        min: widget.min,
        max: widget.max,
        value: _value.toDouble(),
        label: widget.label,
        divisions: widget.divisions,
        onChanged: (value) {
          if (_value != value) {
            setState(() {
              _value = value;
            });
            widget.onChanged(value.toDouble());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orientation == RadioSliderOrientation.Vertical) {
      return RotatedBox(quarterTurns: 1, child: _buildRadioSlider(context));
    } else {
      return _buildRadioSlider(context);
    }
  }
}
