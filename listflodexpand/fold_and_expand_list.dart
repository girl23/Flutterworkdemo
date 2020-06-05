import 'package:flutter/material.dart';
import 'expand_state_bean.dart';
import 'expansion_panel_list.dart' as fold;

//头部点击回调
typedef HeaderClickCallback = void Function(int panelIndex, bool isExpanded);
//子项点击回调
typedef SubItemClickCallback = void Function(int parentIndex, int childIndex);

class ZLExpansionPanelList extends StatefulWidget {
  final bool hasDividers;//分割线
  final bool canTapOnHeader;//是否可以点击头部
  final List <Widget>headerWidgets;
  final List <List<Widget>> subWidgets;//子项视图
  final HeaderClickCallback headerClickCallback;//头部点击回调
  final SubItemClickCallback subItemClickCallback;//子项点击回调
  ZLExpansionPanelList(this.headerWidgets, this.subWidgets,{Key key,this.hasDividers=true,this.canTapOnHeader = false,this.headerClickCallback,this.subItemClickCallback}):super(key: key);
  ZLExpansionPanelListState createState() => ZLExpansionPanelListState();
}
class ZLExpansionPanelListState extends State<ZLExpansionPanelList> {
  //记录headerIndex;
  List <int>_mList=[];
  //记录headerIndex对应的折叠状态
  List<ExpandStateBean> _expandStateList;
  loadData(){
    print('取消全选/加载新数据');
    _mList=new List();
    _expandStateList=new List();

    for(int i=0;i<widget.headerWidgets.length;i++){
      _mList.add(i);
      _expandStateList.add(ExpandStateBean(i,false));//默认全部折叠
    }
  }
  //全选
  selectAll(){
    print('全选');
    _mList=new List();
    _expandStateList=new List();
    for(int i=0;i<widget.headerWidgets.length;i++){
      _mList.add(i);
      _expandStateList.add(ExpandStateBean(i,true));//默认全部折叠
    }
  }
  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
      _expandStateList.forEach((item){
        if(item.index==index){
          item.isOpen=!isExpand;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {


    return Container(
      child: SingleChildScrollView(
        child:fold.ExpansionPanelList(
          hasDividers: widget.hasDividers,
          //交互回调属性，里面是个匿名函数
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
            widget.headerClickCallback(index,bol);
          },
          //进行map操作，然后用toList再次组成List
          children:
          _mList.map((index){
            //返回一个组成的ExpansionPanel
            return
              fold.ExpansionPanel(
                headerBuilder: (context,isExpanded){
                  return widget.headerWidgets[index];
                },
                body: Container(
                    child:
                    Column(
                      children:
                      <Widget>[
                        subWidget(widget.subWidgets[index], index),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                ),
                isExpanded:_expandStateList[index].isOpen,//闭合状态
                canTapOnHeader: widget.canTapOnHeader,
              );
          }).toList(),
        ),
      ),
    );
  }

  Widget subWidget(List subWidget,int index){
    List <int>smList=new List();
    for(int i=0;i<subWidget.length;i++){
      smList.add(i);
    }
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children:smList.map((subIndex){
        return Material(
            child: Ink(
                child: InkWell(
                  onTap: (){
                    widget.subItemClickCallback(index,subIndex);
                  },
                  child: subWidget[subIndex],
                )
            )
        );
      }
      ).toList(),
    );
  }
}