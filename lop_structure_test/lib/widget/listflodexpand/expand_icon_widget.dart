import 'package:flutter/material.dart';
class ExpandIcon extends StatefulWidget {
  const ExpandIcon({
    Key key,
    this.isExpanded = false,
    @required this.valueChanged,
  }) : assert(isExpanded != null),
        super(key: key);

  final bool isExpanded;

  final ValueChanged<bool> valueChanged;

  @override
  _ExpandIconState createState() => _ExpandIconState();
}

class _ExpandIconState extends State<ExpandIcon> with SingleTickerProviderStateMixin {

  void _handlePressed() {
    if (widget.valueChanged != null)
      widget.valueChanged(widget.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isExpanded,
      onChanged: (bool value) {
        setState(() {
          _handlePressed();
        });
      },
    );
  }
}
