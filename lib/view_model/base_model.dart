import 'package:flutter/material.dart';
import 'package:flutterlivingapp/enum/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners(); //it will dispose the state after process will be done
  }
}
