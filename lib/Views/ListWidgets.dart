
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Models/Device.dart';
import 'package:lit/Models/Zone.dart';
import 'package:lit/Models/data.dart';
import 'package:lit/Screens/zonePage.dart';
import 'package:lit/Views/DeviceButton.dart';


class ZoneButton extends StatefulWidget {

  final zone;

  final function;
  static List<double> shadowData = <double>[0,0,0,0,0,0];
  static List<int> numItems = <int>[2];


  ZoneButton({Key key, this.function, this.zone}) : super(key:key);

  @override
  _ZoneButtonState createState() => _ZoneButtonState();
}

class _ZoneButtonState extends State<ZoneButton> {


  @override
  Widget build(BuildContext context) {

    Zona _zone;
    _zone = widget.zone;

        return Opacity(
          opacity: 0.7,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: MediaQuery.of(context).size.width/5.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.darkShadeColor,
                      offset: Offset(ZoneButton.shadowData[0], ZoneButton.shadowData[1]),
                      blurRadius: ZoneButton.shadowData[2],
                      spreadRadius: ZoneButton.shadowData[3],
                    ),
                    BoxShadow(
                      color: Colors.white,//Color.fromRGBO(255, 255, 255, 0.7),
                      offset: Offset(ZoneButton.shadowData[4], ZoneButton.shadowData[5]),
                      blurRadius: ZoneButton.shadowData[2],
                      spreadRadius: ZoneButton.shadowData[3],
                    ),
                  ]),

              child: OutlinedButton(
                onPressed: () {ZoneButton.shadowData = [6,2,4,2,-5,-2];
                setState(() {});},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.8, color: AppConstants.appSecondaryColor),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  minimumSize: Size(MediaQuery.of(context).size.width/2.4,MediaQuery.of(context).size.width/2.8),
                  backgroundColor: Colors.black54,
                ),
                child: ListTile(
                leading: _zone.icon,
                title: Text(_zone.name),
                subtitle: Text('${_zone.numDevices.toString()} Items'),
                onTap: () => {
                Navigator.pushNamed(context, ZonePage.routeName, arguments: {'Zone': _zone}).then((_) => setState((){}),),
                },
              ),
              ),
        ),
          ),
        );

  }
}












class FavoriteButtons extends StatefulWidget {

  FavoriteButtons({Key  key}) : super (key: key);

  @override
  _FavoriteButtonsState createState() => _FavoriteButtonsState();
}

class _FavoriteButtonsState extends State<FavoriteButtons>{
  @override
  Widget build(BuildContext context) {
    Device _thisdevice;
    
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: InventedData.favoriteDevices.length,
        itemBuilder: (context, index){
          _thisdevice = InventedData.favoriteDevices[index];
      return Padding(
        padding: const EdgeInsets.fromLTRB(3,7,10,7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DeviceButton(_thisdevice),
          ],
        ),
      );
    });
  }
}



