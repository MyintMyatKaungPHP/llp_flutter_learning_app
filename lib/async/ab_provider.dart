import 'package:flutter/widgets.dart';

class ABProvider with ChangeNotifier{
  int a = 0;
  int b = 0;

  void minus_A(){
    if(a!=0){
      a--;
      notifyListeners();
    }
  }

  void plus_A(){
    a++;
    notifyListeners();
  }


  void minus_B(){
    if(b!=0){
      b--;
      notifyListeners();
    }
  }

  void plus_B(){
    b++;
    notifyListeners();
  }

}