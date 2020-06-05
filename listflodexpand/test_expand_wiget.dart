import 'package:flutter/material.dart';
//import 'expand_state_bean.dart';
import 'fold_and_expand_list.dart';

class ZeDieDemo extends StatefulWidget {
  @override
  _ZeDieDemoState createState() => _ZeDieDemoState();
}
class _ZeDieDemoState extends State<ZeDieDemo> {

 final GlobalKey<ZLExpansionPanelListState>key=GlobalKey<ZLExpansionPanelListState>();
 bool value=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('fold/expand'),
      ),
      body:Container(
          width: 200,
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                child:ZLExpansionPanelList([Text('文科'),Text('理科'),Text('艺术'),Text('兴趣')],
                 [[Text('1'),Text('2')],[Text('3'),Text('4')],[Text('5')],[Text('1'),Text('2'),Text('1'),Text('2')]],hasDividers:true,headerClickCallback: (index,expand){
                  print('####$index---$expand');
                },subItemClickCallback: (parentIndex,subIndex){
                  print('******$parentIndex---$subIndex');
                },key: key,) ,
              ),

              Checkbox(
                value: this.value,
                onChanged: (bool value) {
                  print('=====$value');
                  if(value){
                    print('全选');
                    key.currentState.selectAll();
                  }else{
                    print('取消全选');
                    key.currentState.loadData();
                  }
                  setState(() {
                  });
                  this.value=!this.value;
                },
              ),
            ],
          )
      ),
    );
  }
}
