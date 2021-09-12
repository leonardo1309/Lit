import 'package:flutter/cupertino.dart';

class Device {

  String name;
  String belongsTo = 'zone';
  String id;
  double value;
  bool isOn;
  bool firstUse = true;
  Icon icon;
  IconData iconData;

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
