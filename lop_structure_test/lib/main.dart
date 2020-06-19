import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lopstructuretest/provider/sign_item_provider.dart';
import 'package:lopstructuretest/widget/circle_progress.dart';
import 'package:lopstructuretest/widget/drawer/ly_slide_drawer.dart';
import 'package:lopstructuretest/widget/expansion/ly_expansion_item.dart';
import 'package:lopstructuretest/widget/item/ly_change_textsize.dart';
import 'package:lopstructuretest/widget/item/ly_change_textsize_slide.dart';
import 'package:lopstructuretest/widget/item/ly_local_text.dart';
import 'package:lopstructuretest/widget/item/ly_sign_item.dart';
import 'package:lopstructuretest/widget/listflodexpand/fold_and_expand_list.dart';
import 'package:lopstructuretest/widget/sectionlistview/lib_scroll_to_index/list_view_delegate.dart';
import 'package:lopstructuretest/widget/sectionlistview/lib_scroll_to_index/section_list_view.dart';
import 'package:lopstructuretest/widget/sectionlistview/lib_scroll_to_index/section_scroll_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '点击屏幕滑出和收起抽屉'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextType type = TextType.zh;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool value = false;
  List<int> naChecks = List();
  List<int> normalChecks = List();
  SectionScrollController controller = SectionScrollController();
  void _incrementCounter() {
    setState(() {
      if (type == TextType.all) {
        type = TextType.zh;
      } else if (type == TextType.zh) {
        type = TextType.en;
      } else if (type == TextType.en) {
        type = TextType.all;
      }
    });
  }

  String zhText = "我是中国人！！！";
  String enText = "I am Chinese ！！！";
  TextStyle style = TextStyle(color: Colors.red, fontWeight: FontWeight.w600);
  final double _initFabWidth = 80.0;
  double _panelWidthOpen;
  double _panelWidthClosed = 30.0;
  double appbarSize = 40.0;
  final GlobalKey<ZLExpansionPanelListState> key =
      GlobalKey<ZLExpansionPanelListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _panelWidthOpen = MediaQuery.of(context).size.width * .70;
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<SingItemProvider>(
          create: (_) => SingItemProvider(),
        )
      ],
      child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appbarSize),
              child: AppBar(
                title: Text(widget.title),
              )),
          body: Consumer<SingItemProvider>(builder: (context, provider, child) {
            return LySlideDrawer(
              maxWidth: _panelWidthOpen,
              minWidth: _panelWidthClosed,
              padding: EdgeInsets.zero,
              backdropEnabled: false,
              parallaxEnabled: false,
              appbarSize: appbarSize,
              headHeight: 100,
              footerHeight: 200,
              isDraggable: provider.drawerisDragable,
              footer: _buildFooter(context),
              defaultPadding: false,
              color: Colors.white,
              parallaxOffset: 1,
              header: _buildHeader(context),
              slideDirection: SlideDirection.LEFT,
              body: _buildBody(context, provider),
              panelBuilder: (sc) => _buildPanel(context),
//        onPanelSlide: (double pos) => setState(() {
//          _fabWidth =
//              pos * (_panelWidthOpen - _panelWidthClosed) + _initFabWidth;
//        }),
            );
          })),
    );
  }

  Widget _buildBody(BuildContext context, provider) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("点击签署");
        },
        tooltip: "点击签署",
        backgroundColor: Colors.red,
        child: Text(
          "签署",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrange,
        child: Container(
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("na个数:${provider.naChecks.length}"),
              Text("一般个数:${provider.normalChecks.length}"),
            ],
          ),
        ),
      ),
      body: _builderList(),
//          body: ListView.builder(
//              itemCount: Constants.itemDatas1.length,
//              shrinkWrap: true,
//              itemBuilder: (context, index) {
//                ///itemLists
//                return LySignItem(
//                  Constants.itemDatas1[index],
//                  MediaQuery.of(context).size.width,
//                  type,
//                );
//              }),
    );
  }

  Widget _builderList() {

    return SectionListView(
      sectionHover: true,
      listViewDelegate: ListViewDelegate(sectionCount: () {
        return Constants.itemDatas.length;
      }, rowCountOfSection: (index) {
        return Constants.itemDatas[index]["items"].length;
      }),
      listViewDataSourceDelegate: ListViewDataSourceDelegate(
          sectionWidgetBuilder:
              (BuildContext context, IndexPath indexPath, int index) {
        return Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green
          ),
          child: Center(
            child: Text(Constants.itemDatas[indexPath.section]["processName"],style: TextStyle(color: Colors.white),),
          ),

        );
      }, cellWidgetBuilder:
              (BuildContext context, IndexPath indexPath, int index) {
        return LySignItem(
          Constants.itemDatas[indexPath.section]["items"][indexPath.row],
          MediaQuery.of(context).size.width,
          type,
        );
      }),
      controller: controller,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: _panelWidthOpen,
      height: 100,
      decoration: BoxDecoration(color: Colors.yellow),
      child: Center(
        child: CircleProgress(
            [Colors.red, Colors.blue, Colors.green], [50, 30, 20],
            center: Offset(50, 50),
            radius: 40,
            startAngle: pi,
            filled: false,
            strokeWidth: 8),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: _panelWidthOpen,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: this.value,
            onChanged: (bool value) {
              print('=====$value');
              if (value) {
                print('全选');
                key.currentState.selectAll();
              } else {
                print('取消全选');
                key.currentState.loadData();
              }
//                  key.currentState.test();
              setState(() {});
              this.value = !this.value;
            },
          ),
          LyChangeTextSize(),
          LyChangeTextSizeSlide()
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    return ZLExpansionPanelList(
      _buildExpandHeader(context),
      _buildExpandItem(context),
      hasDividers: true,
      headerClickCallback: (index, expand) {
        print('####$index---$expand');
      },
      subItemClickCallback: (parentIndex, subIndex) {
        print('******$parentIndex---$subIndex');
      },
      key: key,
      canTapOnHeader: true,
    );
  }

  List<Widget> _buildExpandHeader(BuildContext context) {
    List<Widget> headers = Constants.MOUDLES1.map((value) {
      return ListTile(
        title: Text(value),
      );
    }).toList();
    return headers;
  }

  List<List<Widget>> _buildExpandItem(BuildContext context) {
    List<List<Widget>> items = Constants.PROCESSES.map((value) {
      var moudleId = value["moudleId"];
      var moudleTitle = value["moudleTitle"];
      List processes = value["processes"];
      return processes.map((process) {
        return LyExpansionItem(
            moudleId, process["processId"], process["processTitle"],
            (moudleId, processId) {
          print("LyExpansionItem:${moudleId} ${processId}");
        });
      }).toList();
    }).toList();
    return items;
  }
}
