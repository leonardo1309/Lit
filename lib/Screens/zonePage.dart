import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Models/Device.dart';
import 'package:lit/Models/Zone.dart';
import 'package:lit/Models/data.dart';
import "package:collection/collection.dart";
import 'package:lit/Views/DeviceButton.dart';

class ZonePage extends StatefulWidget {

  static final String routeName = '/ZonePageRoute';
  final Zona zone;


  ZonePage ( {this.zone,Key key}) : super (key: key);

  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {

  static Zona _zone;
  static Map <bool , List<Device>> devicesInThisZone;
  static List<Device> listOfDevicesInThisZone;


@override
  void initState() {
    _zone = widget.zone;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context).settings.arguments as Map;
    if(arguments != null) {
      _zone = arguments['Zone'];
    if(InventedData.listOfDevices.length > 0){
    devicesInThisZone = groupBy(InventedData.listOfDevices, (d) => d.belongsTo == _zone.name);
    listOfDevicesInThisZone = devicesInThisZone.values.elementAt(0);
    print(listOfDevicesInThisZone);
  }else listOfDevicesInThisZone = null;}

    return Scaffold(
      backgroundColor: AppConstants.appColor,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Container(
                      //color: Colors.greenAccent,
                      height: MediaQuery.of(context).size.height/4,
                      child: Text(_zone.name, style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),alignment: Alignment.bottomCenter,),
                  ),

                    GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfDevicesInThisZone != null ? listOfDevicesInThisZone.length : 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:10,
                        mainAxisSpacing: 20,
                        childAspectRatio: 3/4,
                      ),
                      itemBuilder: (context, index){
                        print(devicesInThisZone);
                        return InkResponse(
                          enableFeedback: true,
                          child: DeviceButton(listOfDevicesInThisZone[index]),
                          onTap: ()=>{},
                        );
                      },
                    ),

              ],
            ),
          ),
        ),

    );
  }

}

int indexu (int n) {
  n--;
  return n;
}