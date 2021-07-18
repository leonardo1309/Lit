
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/basePage.dart';
import 'package:lit/Screens/zonePage.dart';

class ZoneListTile extends StatefulWidget {

  final function;
  static int Ind;
  static List<double> shadowData = <double>[0,0,0,0,0,0];
  static Icon iconX;
  static String subTitl;
  static List<String> zones = <String>['+'];
  static List<int> numItems = <int>[2];
  ZoneListTile({Key key, this.function}) : super(key:key);

  @override
  _ZoneListTileState createState() => _ZoneListTileState();
}

class _ZoneListTileState extends State<ZoneListTile> {

  //static List<Icon> Iconos = <Icon>[Icon(Icons.airline_seat_individual_suite),Icon(Icons.ac_unit),Icon(Icons.attractions),Icon(Icons.checkroom_outlined),Icon(Icons.child_friendly_outlined),Icon(Icons.clean_hands_outlined),Icon(Icons.cleaning_services_outlined),Icon(Icons.deck_outlined),Icon(Icons.emoji_objects_outlined)];


  @override
  Widget build(BuildContext context) {
    return ListView.builder (
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: ZoneListTile.zones.length,
        itemBuilder: (context, index){
          ZoneListTile.Ind = index;
        return Opacity(
          opacity: 0.7,
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: MediaQuery.of(context).size.width/2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.darkShadeColor,
                    offset: Offset(ZoneListTile.shadowData[0], ZoneListTile.shadowData[1]),
                    blurRadius: ZoneListTile.shadowData[2],
                    spreadRadius: ZoneListTile.shadowData[3],
                  ),
                  BoxShadow(
                    color: Colors.white,//Color.fromRGBO(255, 255, 255, 0.7),
                    offset: Offset(ZoneListTile.shadowData[4], ZoneListTile.shadowData[5]),
                    blurRadius: ZoneListTile.shadowData[2],
                    spreadRadius: ZoneListTile.shadowData[3],
                  ),
                ]),

            child: OutlinedButton(
              onPressed: () {ZoneListTile.shadowData = [6,2,4,2,-5,-2];
              setState(() {});},
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.8, color: Colors.white),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                minimumSize: Size(MediaQuery.of(context).size.width/2.4,MediaQuery.of(context).size.width/2.8),
              ),
              child: ListTile(
              leading: iconForButton(),
              title: titleForButton(),
              subtitle: Text(subForButton()),//Text('${ZoneListTile.numItems[index].toString()} Items'),
              onTap: () => {

                if(ZoneListTile.zones.length == 1) {
                  widget.function(1),
                } else{
                  widget.function(index >= ZoneListTile.zones.length-1 ? 1 : 2),
                }
              },
            ),
            ),
        ),
        );
      }
    );
  }
}

Icon iconForButton(){
  if(ZoneListTile.zones.length == 1){
    return null;
  }else if(ZoneListTile.Ind >= ZoneListTile.zones.length-1){return null;}
  else return Icon(Icons.home_outlined);
}

String subForButton(){
  if(ZoneListTile.zones.length == 1){
    return '';
  }else if(ZoneListTile.Ind >= ZoneListTile.zones.length-1){return '';}
  else return '${ZoneListTile.numItems[ZoneListTile.Ind].toString()} Items';
}

Text titleForButton(){
  if(ZoneListTile.zones.length == 1){
    return Text(ZoneListTile.zones[ZoneListTile.Ind],textAlign: TextAlign.center, style: TextStyle(
      fontSize: 50,
      color: Colors.white,
    ),);
  }else if(ZoneListTile.Ind >= ZoneListTile.zones.length-1){return Text(ZoneListTile.zones[ZoneListTile.Ind],textAlign: TextAlign.center, style: TextStyle(
    fontSize: 50,
  ),);}
  else return Text(ZoneListTile.zones[ZoneListTile.Ind]);
}




bool OnOffs () {
  BasePage.isOn = !BasePage.isOn;
}


class FavButtons extends StatefulWidget {

  static List<String> favorites = <String>['+'];
  final func;

  FavButtons({Key  key, this.func}) : super (key: key);

  @override
  _FavButtonsState createState() => _FavButtonsState();
}

class _FavButtonsState extends State<FavButtons>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: FavButtons.favorites.length,
        itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: Container(
          width: MediaQuery.of(context).size.width/5,
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
                  color: Colors.white,//getShadowColor(),
                  offset: Offset(-5, -2),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ),
              ]),
          child: MaterialButton(
            onPressed: () => {
              if(FavButtons.favorites.length == 1) {
              widget.func(1),
            } else{
              widget.func(index >= FavButtons.favorites.length-1 ? 1 : 2),
            }
            },
            child: Text(FavButtons.favorites[0],style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),),
          ),
        ),
      );
    });
  }

}
