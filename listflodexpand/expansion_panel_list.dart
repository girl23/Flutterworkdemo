import 'package:flutter/material.dart';
import 'expand_icon_widget.dart' as iconBtn;

const double _kPanelHeaderCollapsedHeight = kMinInteractiveDimension;//48
class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);
  final S salt;
  final V value;
  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType)
      return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt
        && value == typedOther.value;
  }
  @override
  int get hashCode => hashValues(runtimeType, salt, value);
  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}
typedef ExpansionPanelCallback = void Function(int panelIndex, bool isExpanded);
typedef ExpansionPanelHeaderBuilder = Widget Function(BuildContext context, bool isExpanded);
class ExpansionPanel {
  ExpansionPanel({
    @required this.headerBuilder,
    @required this.body,
    this.isExpanded = false,
    this.canTapOnHeader = false,
  }) : assert(headerBuilder != null),
        assert(body != null),
        assert(isExpanded != null),
        assert(canTapOnHeader != null);

  final ExpansionPanelHeaderBuilder headerBuilder;

  final Widget body;

  final bool isExpanded;

  final bool canTapOnHeader;

}

class ExpansionPanelList extends StatefulWidget {

  const ExpansionPanelList({
    Key key,
    this.children = const <ExpansionPanel>[],
    this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
    this.hasDividers=false,
    this.icon,
  }) : assert(children != null),
        assert(animationDuration != null),
        super(key: key);

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback expansionCallback;

  final Duration animationDuration;

  final bool hasDividers;

  final Icon icon;

  @override
  State<StatefulWidget> createState() => _ExpansionPanelListState();
}

class _ExpansionPanelListState extends State<ExpansionPanelList> {
  //查看当前节点是否是展开的
  bool _isChildExpanded(int index) {
    return widget.children[index].isExpanded;
  }
  //点击回调
  void _handlePressed(bool isExpanded, int index) {
    if (widget.expansionCallback != null)
      widget.expansionCallback(index, isExpanded);
  }
  @override
  Widget build(BuildContext context) {

    final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];

    for (int index = 0; index < widget.children.length; index += 1) {
      final ExpansionPanel child = widget.children[index];
      final Widget headerWidget = child.headerBuilder(
        context,
        _isChildExpanded(index),
      );
      //图标
      Widget expandIconContainer = Container(
          child: iconBtn.ExpandIcon(
            isExpanded: _isChildExpanded(index),
            valueChanged:(bool isExpanded) => _handlePressed(isExpanded, index)),
      );
      //头部布局
      Widget header = Row(
        children: <Widget>[
          expandIconContainer,
          Expanded(//控制充满
            child: AnimatedContainer(
              duration: widget.animationDuration,
              curve: Curves.fastOutSlowIn,
              //              margin:EdgeInsets.all(10),//整个条目//EdgeInsets.zero, //_isChildExpanded(index) ? kExpandedEdgeInsets : EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: _kPanelHeaderCollapsedHeight),//控制head文本内容最小高度
                child: headerWidget,
              ),
            ),
          ),

        ],
      );
      if (child.canTapOnHeader) {
        header = MergeSemantics(
          child: InkWell(
            onTap: () => _handlePressed(_isChildExpanded(index), index),
            child: header,
          ),
        );
      }
      items.add(
        MaterialSlice(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          child: Column(
            children: <Widget>[
              header,
              AnimatedCrossFade(
                //控制折叠
                firstChild: Container(
//                      color: Colors.blue,
//                      height: 5.0//折叠时控制行与行间隔
                ),
                secondChild: child.body,
                firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                crossFadeState: _isChildExpanded(index) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: widget.animationDuration,
              ),
            ],
          ),
        ),
      );
    }
    return MergeableMaterial(
      hasDividers: widget.hasDividers,
      children: items,
    );
  }
}
