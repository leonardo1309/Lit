import 'package:flutter/cupertino.dart';

class Device extends ChangeNotifier {

  String name;
  String belongsTo = 'zone';
  String id;
  double value;
  bool isOn;
  bool firstUse = true;
  Icon icon;
  IconData iconData;

  bool get isTurnedOn => isOn;

  void toggle(){
    isOn = !isOn;
    notifyListeners();
  }

  void changeValue (_value) {
    value = _value;
    if(value < 5) isOn = false;
    notifyListeners();
  }

  Device({this.name,this.id, this.value, this.isOn, this.icon, this.belongsTo});

  void setValue () {

}
  double getValue () {
    return value;
  }
  bool getState () {
    return isOn;
  }
}
