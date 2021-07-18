import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/zonePage.dart';
import 'package:lit/Views/ListWidgets.dart';

TextEditingController textEditingController = TextEditingController();

class BasePage extends StatefulWidget {
  static final String routeName = '/BasePageRoute';
  static bool isOn = false;
  static Alignment childAlignment = Alignment.center;
  final addItems;
  static var ran = new Random();


  BasePage({Key key, this.addItems}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  void showDialogue(number) {
    if(number == 1) {
      showDialog(context: context, builder: (BuildContext context){return AnimatedContainer(
          curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: BasePage.childAlignment ,child: AlertDialog(
        scrollable: true,
        backgroundColor: Colors.transparent,


        title: Text('Configure new zone',style: TextStyle(
          color: Colors.white,
        ),),



        content: StatefulBuilder(
            builder: (context, setState){
              return Column(children: <Widget>[
                Text('Please enter name for the new zone',style: TextStyle(
                  color: Colors.white,
                ),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,25,0,25),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Zone name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                    controller: textEditingController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,15),
                  child: Text('Please select icon for the new zone',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                IconButton(icon: Icon(Icons.arrow_drop_down_circle_outlined), onPressed: ()=>{},color: Colors.white,iconSize: 60,)
              ],);
            }
        ),


        actions: [
          FlatButton(onPressed: (){Navigator.of(context).pop();textEditingController.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
          FlatButton(onPressed: (){setState(() {
            ZoneListTile.zones.insert(ZoneListTile.zones.length-1,textEditingController.text);
            ZoneListTile.numItems.insert(ZoneListTile.zones.length-1, BasePage.ran.nextInt(6));
          });
          Navigator.of(context).pop();
          textEditingController.text = '';
          }, child: Text('Ok', textAlign:TextAlign.right, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
        ],
        elevation: 12,
      ),
      );
      },
      );
    } else if (number == 2){
      Navigator.pushNamed(context, ZonePage.routeName);
    }
  }

  void showDialogueFav(number) {
    if(number == 1) {
      showDialog(context: context, builder: (BuildContext context){return AnimatedContainer(
        curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: BasePage.childAlignment ,child: AlertDialog(
        scrollable: true,
        backgroundColor: Colors.transparent,


        title: Text('Configure favorite device',style: TextStyle(
          color: Colors.white,
        ),),



        content: StatefulBuilder(
            builder: (context, setState){
              return Column(children: <Widget>[
                Text('Please enter name of the device',style: TextStyle(
                  color: Colors.white,
                ),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,25,0,25),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Device name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                    controller: textEditingController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,15),
                  child: Text('Please select icon for the device',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                IconButton(icon: Icon(Icons.arrow_drop_down_circle_outlined), onPressed: ()=>{},color: Colors.white,iconSize: 60,)
              ],);
            }
        ),


        actions: [
          FlatButton(onPressed: (){Navigator.of(context).pop();textEditingController.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
          FlatButton(onPressed: (){setState(() {
            FavButtons.favorites.insert(FavButtons.favorites.length-1,textEditingController.text);
          });
          Navigator.of(context).pop();
          textEditingController.text = '';
          }, child: Text('Ok', textAlign:TextAlign.right, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
        ],
        elevation: 12,
      ),
      );
      },
      );
    } else if (number == 2){
      Navigator.pushNamed(context, ZonePage.routeName);
    }
  }


  FocusNode focusnode;
  String hintext = '';
  bool showSBar = false;
  Icon barIcon = Icon(Icons.search);
  Widget sBar = Text('');



  @override
  void initState() {
    focusnode = FocusNode();
    focusnode.addListener(() {
      if(focusnode.hasFocus){
        hintext = '';
      }else{
        hintext = 'Search Zone';
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusnode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Color getShadowColor(){
      if(BasePage.isOn == true){
        return Colors.yellow;
      }else{
        return Colors.white;
      }
    }

    return Scaffold(
      backgroundColor: AppConstants.appColor,
      drawer: Drawer(),


      /*appBar: GradientAppBar(
        backgroundColorStart: AppConstants.appBarColor,
        backgroundColorEnd: AppConstants.appColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Align(child: Text('Lit',style: TextStyle(
            fontSize: 25,
            //fontStyle: FontStyle.italic,
          ),),alignment: Alignment.center,),
        ),
        elevation: 10,
        titleSpacing: 25,
        actions: [
          IconButton(icon: barIcon, onPressed: (){
            setState(() {
              if(!this.showSBar){
                this.sBar = TextField(focusNode: focusnode, textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white,
                ),cursorColor: Colors.white, textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintext,hintStyle: TextStyle(color: Colors.white,),
                ),);
                focusnode.requestFocus();
                this.barIcon = Icon(Icons.cancel_outlined);
                this.showSBar = !this.showSBar;
              }else{
                this.sBar = Text('');
                this.barIcon = Icon(Icons.search);
                this.showSBar = !this.showSBar;
              }
            });
          }),
          IconButton(icon: Icon(Icons.menu), onPressed: (){}),
        ],
        title: sBar,
      ),*/







      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 20),
              child: Text('Dispositivos favoritos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              decoration: BoxDecoration(
                //color: AppConstants.appColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                             FavButtons(func: showDialogueFav,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text('Todos los dispositivos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
            ),


              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/2.4,
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ZoneListTile(function: showDialogue,),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
    }
  }

bool OnOff () {
  BasePage.isOn = !BasePage.isOn;
}

