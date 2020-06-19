import 'package:flutter/foundation.dart';

class SingItemProvider extends ChangeNotifier{

  List<int> naChecks = List();
  List<int> normalChecks = List();
  double _textSize = 16.0;
  bool _drawerisDragable = true;


  bool get drawerisDragable => _drawerisDragable;

  set drawerisDragable(bool value) {
    _drawerisDragable = value;
    notifyListeners();
  }

  double get textSize => _textSize;

  set textSize(double value) {
    _textSize = value;
    notifyListeners();
  }

  void naCheckedChange(int id,bool check){
    if(check){
      naChecks.add(id);
      normalChecks.remove(id);
    }else{
      naChecks.remove(id);
    }
    notifyListeners();
  }
  void normalCheckedChange(int id,bool check){
    if(check){
      normalChecks.add(id);
      naChecks.remove(id);
    }else{
      normalChecks.remove(id);
    }
    notifyListeners();
  }
}