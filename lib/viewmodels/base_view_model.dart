import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier{
  bool _busy =false;
  bool get busy =>_busy;

  setBusy(bool value)
  {
    _busy=value;
    notifyListeners();
  }
  
}
