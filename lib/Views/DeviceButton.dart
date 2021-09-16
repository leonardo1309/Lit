import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Models/Device.dart';
import 'package:lit/Models/data.dart';
import 'package:lit/Screens/basePage.dart';
import 'package:lit/Screens/devicePage.dart';
import 'package:provider/provider.dart';

import 'ListWidgets.dart';

class DeviceButton extends StatefulWidget{
  final Device device;

  DeviceButton( this.device, { Key key}) : super (key:key);
  @override
  _DeviceButtonState createState() => _DeviceButtonState();
}

class _DeviceButtonState extends State<DeviceButton>{
  @override
  Widget build(BuildContext context) {

    //final isOn = Provider.of<Device>(context).isTurnedOn;
    Device _device;
    _device = widget.device; //InventedData.listOfDevices.indexWhere((dev) => dev.id == _device.id);



    Color getShadowColor(){ // Necesita rehacerse con Id en vez de indexx

      if(InventedData.listOfDevices != null)
      {
          if(_device.isOn == true)
          {
            return AppConstants.favColor;
          }else{
            return Colors.transparent;
          }
      }
      else return Colors.transparent;
    }


    return Padding(
            padding: const EdgeInsets.fromLTRB(3,7,10,3),
            child: Consumer<Device>(
              builder: (context, device, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedPhysicalModel(
                      duration: Duration(milliseconds: 500),
                      shape: BoxShape.circle,
                      color: AppConstants.appColor,
                      elevation: device.isOn ? 8 : 0,
                      shadowColor: AppConstants.appSecondaryColor,
                      curve: Curves.easeInQuad,
                      animateColor: false,
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getShadowColor(),
                          border: Border.all(
                              color: AppConstants.appSecondaryColor, width: 2),
                        ),

                        child: Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.all(0),
                            minWidth: 0,
                            onPressed: () =>
                            {
                              // DevicePage.indexx = index,
                              setState(() {
                                _device.isOn = !_device.isOn;
                                _device.icon = Icon(_device.iconData,
                                  color: _device.isOn ? AppConstants
                                      .appSecondaryColor : Colors.white,);
                                print('device: ${_device.name }, ${_device
                                    .isOn}');
                              }),

                            },
                            onLongPress: () =>
                            {
                              DevicePage(_device),
                              Navigator.pushNamed(context, DevicePage.routeName,
                                  arguments: {'device': _device}).then((_) =>
                                  setState(() {
                                    _device.icon = Icon(_device.iconData,
                                      color: _device.isOn ? AppConstants
                                          .appSecondaryColor : Colors.white,);
                                    print('set this shit');
                                  })),
                            },
                            child: _device.icon,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(_device.name,
                        style: TextStyle(
                          fontSize: 10,
                          color: _device.isOn
                              ? AppConstants.appSecondaryColor
                              : Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ],
                );
              },
            ),
          );
        }
  }







  class AddFavoriteButton extends StatefulWidget {
  final Function function;
    AddFavoriteButton({ Key key, this.function,}) : super (key:key);

  @override
  _AddFavoriteButtonState createState() =>_AddFavoriteButtonState();
  }

  class _AddFavoriteButtonState extends State<AddFavoriteButton> {


  @override
  Widget build(BuildContext context) {

    Device _selectedDevice;
    return Padding(
      padding: const EdgeInsets.fromLTRB(3,7,10,16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width/8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: AppConstants.appSecondaryColor,width: 2),
        ),

        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
              //padding: EdgeInsets.all(0),
              minWidth: 0,
              onPressed: () =>
              {
                widget.function(),
              }
              ),
          ),
        ),
        ],
      ),
    );
  }

  }


class AddZoneButton extends StatefulWidget {
  final Function function;
  AddZoneButton({ Key key, this.function,}) : super (key:key);

  @override
  _AddZoneButtonState createState() =>_AddZoneButtonState();
}

class _AddZoneButtonState extends State<AddZoneButton> {


  @override
  Widget build(BuildContext context) {

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
              title: Align(
                alignment: Alignment.topCenter,
                child: Text('+', style: TextStyle(
                  fontSize: 50,
                  color: AppConstants.appColor,
                ),),
              ),
              onTap: () => {
                  widget.function(), // Crear nueva zona
              },
            ),
          ),
        ),
      ),
    );
  }

}

