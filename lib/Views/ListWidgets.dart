
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
  static bool isOn = false;
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
                  side: BorderSide(width: 1.8, color: AppConstants.appSecondaryColor),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  minimumSize: Size(MediaQuery.of(context).size.width/2.4,MediaQuery.of(context).size.width/2.8),
                  backgroundColor: Colors.black54,
                ),
                child: ListTile(
                leading: iconForButton(),
                title: titleForButton(),
                subtitle: Text(subForButton(),style: TextStyle(color: Colors.white),),//Text('${ZoneListTile.numItems[index].toString()} Items'),
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

class FavButtons extends StatefulWidget {

  static List<String> favorites = <String>['+'];
  static List<bool> areOn = <bool>[false];
  static int Ind;
  Function func;
  bool isOn = false;

  FavButtons({Key  key,this.func, this.isOn }) : super (key: key);

  @override
  _FavButtonsState createState() => _FavButtonsState();
}

class _FavButtonsState extends State<FavButtons>{
  @override
  Widget build(BuildContext context) {

    Color getShadowColor(){
      if(FavButtons.areOn[FavButtons.Ind] == true){
        return AppConstants.appSecondaryColor;
      }else{
        return Colors.transparent;
      }
    }


    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: FavButtons.favorites.length,
        itemBuilder: (context, index){
          FavButtons.Ind = index;
      return Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: Container(
          width: MediaQuery.of(context).size.width/5,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppConstants.appColor,
              border: Border.all(color: AppConstants.appSecondaryColor,width: 2),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(105, 105, 106, 1),//getShadowColor(),
                  offset: Offset(3, 2),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ),
                BoxShadow(
                  color: getShadowColor(),//getShadowColor(),
                  offset: Offset(2, 2),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ),
                BoxShadow(
                  color: Color.fromRGBO(64, 64, 63, 1),//getShadowColor(),
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
              widget.func(index == 0 ? 1 : 2),
                if(index>0){
          setState(() {
            FavButtons.areOn[index] = !FavButtons.areOn[index];
          }),},
            }
            },
            child: Text(favButtonText().data,style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),),
          ),
        ),
      );
    });
  }

}
Text favButtonText(){
  if(FavButtons.favorites.length == 1){
    return Text(FavButtons.favorites[FavButtons.Ind],textAlign: TextAlign.center, style: TextStyle(
      fontSize: 50,
      color: Colors.white,
    ),);
  }else if(FavButtons.Ind >= FavButtons.favorites.length-1){return Text(FavButtons.favorites[FavButtons.Ind],textAlign: TextAlign.center, style: TextStyle(
    fontSize: 50,
  ),);}
  else return Text(FavButtons.favorites[FavButtons.Ind]);
}
