import 'package:flutter/foundation.dart';

class SingItemProvider extends ChangeNotifier{

  List<int> naChecks = List();
  List<int> normalChecks = List();

  void naCheckedChange(int id,bool check){
    if(check){
      naChecks.add(id);
      normalChecks.remove(id);
    }else{
      naChecks.remove(id);
    }
    notifyListeners();
    print("normalChecks:${normalChecks}");
    print("naChecks:${naChecks}");
  }
  void normalCheckedChange(int id,bool check){
    if(check){
      normalChecks.add(id);
      naChecks.remove(id);
    }else{
      normalChecks.remove(id);
    }
    notifyListeners();
    print("normalChecks:${normalChecks}");
    print("naChecks:${naChecks}");
  }
}