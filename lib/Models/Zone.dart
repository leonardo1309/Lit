import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/Device.dart';

class Zona {

  String name;
  int numDevices;
  //List<Device> devicesInZone = [];
  Icon icon = Icon(Icons.add_alert);
  IconData iconData;


  Zona({this.name, this.icon, this.numDevices});
}