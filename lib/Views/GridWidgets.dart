

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/basePage.dart';
import 'package:lit/Screens/devicePage.dart';
import 'package:lit/Screens/zonePage.dart';

class DeviceGridTile extends StatefulWidget {
  DeviceGridTile({Key  key}) : super (key: key);

  @override
  _DeviceGridTileState createState() => _DeviceGridTileState ();
}

class _DeviceGridTileState extends State<DeviceGridTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          AspectRatio(
            aspectRatio: 6/1.5,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ZonePage.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,5,20,5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                    color: AppConstants.appColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppConstants.darkShadeColor,
                        offset: Offset(6, 2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-4, -3),
                        blurRadius: 6.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                    /*image: DecorationImage(
                        image: AssetImage('android/assets/images/TVStandIcon.png'),
                      fit: BoxFit.scaleDown,
                    ),*/
                   // border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10, left: 50),
                    child: Text('Living room',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

       /* AutoSizeText(
          'Cinta led habitacion',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,

          ),
          textAlign: TextAlign.center,
        )*/
      ],
    );
  }

}


class DevManagerGridTile extends StatefulWidget {
  DevManagerGridTile({Key  key}) : super (key: key);

  @override
  _DevManagerGridTileState createState() => _DevManagerGridTileState ();
}


class _DevManagerGridTileState extends State<DevManagerGridTile> {
  @override
  Widget build(BuildContext context) {

    Color getShadowColor(){
      if(ZonePage.isOn == true){
        return Colors.yellow;
      }else{
        return Colors.white;
      }
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/11,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants.appColor,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.darkShadeColor,
                    offset: Offset(6, 2),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: getShadowColor(),//Color.fromRGBO(255, 255, 255, 0.7),
                    offset: Offset(-5, -2),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                ]),
            child: MaterialButton(
              onPressed: () => {setState((){OnOff();})},
              onLongPress: () => {Navigator.pushNamed(context, DevicePage.routeName,),},
  ),
          ),
          Text('Mueble Tv', style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),),
    ],
    );
  }
}

bool OnOff () {
  ZonePage.isOn = !ZonePage.isOn;
}






