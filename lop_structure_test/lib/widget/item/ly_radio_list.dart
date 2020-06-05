import 'package:flutter/material.dart';

class LyRadioList extends StatefulWidget {

  final Function(String value) callBack;
  final List<String> radios;

  const LyRadioList({Key key, this.callBack, this.radios}) : assert(radios != null && radios.length >0),super(key: key);

  @override
  _LyRadioListState createState() => _LyRadioListState();
}

class _LyRadioListState extends State<LyRadioList> {
  String _groupValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _groupValue = widget.radios[0];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildItems(context),
        )
      ],
    );
  }

  List<Widget> _buildItems(BuildContext context){
    List<Widget> items = List<Widget>();
    widget.radios.forEach((value){
      items.add(Radio(value: value,onChanged: (value){setState(() {
        _groupValue = value;
        if(widget.callBack != null){
          widget.callBack(value);
        }
      });},groupValue: _groupValue,activeColor: Colors.blue,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,));
      items.add(Text(value));
    });
    return items;
  }
}
