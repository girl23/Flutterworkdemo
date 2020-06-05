import 'package:flutter/material.dart';

class LyCheckList extends StatefulWidget {
  final Function(List<String> checks) callBack;
  final List<String> checks;

  const LyCheckList({Key key, this.callBack, this.checks}) :assert(checks != null && checks.length > 0), super(key: key);
  @override
  _LyCheckListState createState() => _LyCheckListState();
}

class _LyCheckListState extends State<LyCheckList> {
  Map<String,bool> _checksMap = Map();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.checks.forEach((value){
      _checksMap[value] = false;
    });
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
    _checksMap.forEach((k,v){
      items.add(Checkbox(
        //默认是否选中，tristate 为 false 的时候，value 不能为 null
        value: v,
        //不能为null，如果为 true，value 为 null 的时候显示禁用标识
        tristate: false,
        onChanged: (isCheck) {
          setState(() {
            _checksMap[k] = isCheck;
            if(widget.callBack != null){
              List<String> checks = List();
              _checksMap.forEach((k,v){
                if(v){
                  checks.add(k);
                }
              });
              widget.callBack(checks);
            }
          });
        },
        //选中框的背景颜色
        activeColor: Colors.lightBlueAccent,
        //选中勾的颜色
        checkColor: Colors.red,

      ));
      items.add(Text(k));
    });
    return items;
  }
}
