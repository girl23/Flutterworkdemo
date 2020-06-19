import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lib_scroll_to_index/list_view_delegate.dart';
import 'lib_scroll_to_index/section_list_view.dart';
import 'lib_scroll_to_index/section_scroll_controller.dart';


class TestPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  SectionScrollController controller;
  var sectionDatas = [];

  @override
  void initState() {
    super.initState();
    sectionDatas = getDatas();
    controller = SectionScrollController();
  }

  List<List<String>> getDatas() {
    List<String> source0 = [
      's0-1、概括文章的主要内容  通顺、完整、简洁。',
      's0-2、方法 题目拓展法   段意合并法 六要2113素归纳法。',
      's0-3、题目拓展法 、有的文章\n的题目能高度概括了文章的'
    ];
    List<String> source1 = [
      's1-1、段意合并法.段落大意概括了一段的主要内\n容.把每段大意综合起来答,加以概括,就是整篇文章的主要内容.这是\n最常用的方法.用这种方法要注意两点。',
      's1-2、六要素归纳法 常用于记叙文\n即为 时间、地点、人物、 起因、经过、结果。'
    ];
    List<String> source2 = [
      's2-1、按时间发展变化的不同来划分。以时间的先后为顺\n序的记叙文，宜抓住表示事件发展的关键性词语或者句子，分出\n不同的阶段，从而划分出段\n落层次来。',
      's2-2、按事情的发展阶段的来划分。'
    ];
    List<String> source3 = [
      's3-1、按地点的转换来划分。\n叙事文章，所描述的事情，常常不是发生在同一地点，而是发生在多处地点。',
      's3-2、按内容变化点来划分有的文章，看上去，整个部分好象是难于找到可分点。\n但是，只要我们仔细地辨读，还是可以按照记叙历程的变化划分层次结构。\n比如，李健吾的《雨中登泰山》',
      's3-3、按照表述角度的不同划分。\n有的记叙文，描述的角度不是单一的。\n而是多方面的。',
      's3-4、按思想感情变化来划分。\n有的记叙文，比人物的思想感情变化为线索。\n由此，便可以找到划分段落层次的依据。\n比如，杨朔的《荔枝蜜》，全文以作者对蜜蜂的感情变化为线索。'
    ];
    List<String> source4 = [
      's4-1、概括文章的主要内容  通顺、完整、简洁。',
      's4-2、方法 题目拓展法   段意合并法 六要2113素归纳法。',
      's4-3、题目拓展法 、有的文章\n的题目能高度概括了文章的'
    ];
    List<String> source5 = [
      's5-1、段意合并法.段落大意概括了一段的主要内\n容.把每段大意综合起来答,加以概括,就是整篇文章的主要内容.这是\n最常用的方法.用这种方法要注意两点。',
      's5-2、六要素归纳法 常用于记叙文\n即为 时间、地点、人物、 起因、经过、结果。'
    ];
    List<String> source6 = [
      's6-1、按时间发展变化的不同来划分。以时间的先后为顺\n序的记叙文，宜抓住表示事件发展的关键性词语或者句子，分出\n不同的阶段，从而划分出段\n落层次来。',
      's6-2、按事情的发展阶段的来划分。'
    ];
    return [source0, source1, source2, source3, source4, source5, source6];
  }

  @override
  Widget build(BuildContext context) {
    return SectionListView(
      listViewDelegate: ListViewDelegate(
          sectionCount: _sectionCountBuilder,
          rowCountOfSection: _rowCountOfSectionBuilder),
      listViewDataSourceDelegate: ListViewDataSourceDelegate(
          sectionWidgetBuilder: _buildHeader,
          cellWidgetBuilder: _testItemBuilder,
      ),
      controller: controller,
      sectionHover: true,
    );
  }

  int _sectionCountBuilder() {
    return sectionDatas.length;
  }

  int _rowCountOfSectionBuilder(int section) {
    ///1:1+3;
    ///2:1+2;
    ///3:1+2;
    ///4:1+3;
    List<String> sectionData = sectionDatas[section];

    return sectionData.length;
  }

  Widget _buildHeader(BuildContext context, IndexPath indexPath, int index) {
    int sectionIndex = indexPath.section;
    return Container(
        color: Colors.lightBlue,
        padding:
        sectionIndex == 0 ? EdgeInsets.all(30) : EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Text(
          "Header #$sectionIndex",
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget _testItemBuilder(
      BuildContext context, IndexPath indexPath, int index) {
    int sectionIndex = indexPath.section;
    int itemIndex = indexPath.row;
//    print('section=$sectionIndex, row=$itemIndex, index=$index');
    String item = (sectionDatas[sectionIndex])[itemIndex];
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          child: Text("$index"),
        ),
        title: Text(item),
        onTap: () {
          _scrollToIndex();
        },
      ),
    );
  }
  Future _scrollToIndex() async {
    await controller.scrollToIndex(IndexPath(4,1),
        duration: Duration(milliseconds: 2000));
  }
}
