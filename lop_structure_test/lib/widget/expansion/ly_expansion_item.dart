import 'package:flutter/material.dart';

typedef void LyExpansionItemCallBack(int moudleId,int processId);

class LyExpansionItem extends StatelessWidget {

  final int moudleId;//模块Id
  final int processId;//工序Id
  final String text;//显示的文字
  final double padding;
  final LyExpansionItemCallBack onTap;
  LyExpansionItem(@required this.moudleId,@required this.processId, @required this.text,this.onTap,{this.padding = 20});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: ListTile(
        onTap: (){
          onTap(moudleId,processId);
        },
        title: Text(text??" ",style: TextStyle(color: Colors.black54,fontSize: 18),),
      ),
    );
  }
}
