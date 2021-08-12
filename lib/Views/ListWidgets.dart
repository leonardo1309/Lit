
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/basePage.dart';
import 'package:lit/Screens/devicePage.dart';


class ZoneListTile extends StatefulWidget {

  final function;
  static int Ind;
  static List<double> shadowData = <double>[0,0,0,0,0,0];
  static List<Icon> zoneIcons = [Icon(Icons.home),Icon(Icons.home),Icon(Icons.home),Icon(Icons.home),Icon(Icons.home)];
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
  else return ZoneListTile.zoneIcons[ZoneListTile.Ind];
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
  static List<Icon> favIcons = [Icon(Icons.add,color: Colors.white,),];
  static int Ind;
  static Icon passer;
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
      if(FavButtons.Ind == 1){return Colors.transparent;}
      else if(FavButtons.areOn[FavButtons.Ind] == true){
        return AppConstants.favColor;
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
        padding: const EdgeInsets.fromLTRB(3,7,10,7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPhysicalModel(
              duration: Duration(milliseconds: 500),
              shape: BoxShape.circle,
              color: AppConstants.appColor,
              elevation:  FavButtons.areOn[FavButtons.Ind] ? 8 : 0,
              shadowColor: AppConstants.appSecondaryColor,
              curve: Curves.easeInQuad,
              animateColor: false,
              clipBehavior: Clip.antiAlias,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getShadowColor(),
                    border: Border.all(color: AppConstants.appSecondaryColor,width: 2),
                    ),

                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    minWidth: 0,
                    onPressed: () => {
                      if(FavButtons.favorites.length == 1) {
                      widget.func(1), // Abrir Ventana de creacion de nuevo dispositivo
                    } else if(index == 0){
                    widget.func(1),
                    } else {
                        FavButtons.Ind = index,
                        FavButtons.areOn[index] = !FavButtons.areOn[index],
                        FavButtons.favIcons[index] = Icon(BasePage.icons[index],color: FavButtons.areOn[index] ? AppConstants.appSecondaryColor : Colors.white,),
                        widget.func(2),
                      }
                    },
                    onLongPress: () => {Navigator.pushNamed(context, DevicePage.routeName,),},
                    child: FavButtons.favIcons[FavButtons.Ind],
                  ),
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(FavButtons.Ind != 0 ? favButtonText().data : '',style: TextStyle(
                fontSize: 10,
                color: FavButtons.areOn[FavButtons.Ind] ? AppConstants.appSecondaryColor : Colors.white,
                  //fontWeight: FontWeight.bold,
                ),),
              ),
          ],
        ),
      );
    });
  }

}
Text favButtonText(){
  if(FavButtons.favorites.length == 1){
    return Text(FavButtons.favorites[FavButtons.Ind],
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: 50,
      color: Colors.white,
    ),);
  }else if(FavButtons.Ind >= FavButtons.favorites.length-1){
    return Text(FavButtons.favorites[FavButtons.Ind],
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 50,
    ),
    );
  }
  else return Text(FavButtons.favorites[FavButtons.Ind]);
}
