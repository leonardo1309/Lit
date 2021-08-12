import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/zonePage.dart';
import 'package:lit/Views/ListWidgets.dart';


TextEditingController textEditingController = TextEditingController();
TextEditingController toxtOditingCentraller = TextEditingController();

class BasePage extends StatefulWidget {
  static final String routeName = '/BasePageRoute';
  static bool isOn = false;
  static Icon selectedIcon = Icon(Icons.arrow_drop_down);
  static bool selected = false;
  static List <IconData> icons = [IconData(0),];
  static IconData _iconData;
  static Alignment childAlignment = Alignment.center;
  final addItems;
  static var ran = new Random();



  BasePage({Key key, this.addItems}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  int _index = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];


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
                  //_widgetOptions.elementAt(_selectedIndex),
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
                  IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: ()=>{
                    _pickZoneIcon()
                  },
                    color: Colors.white,
                    iconSize: 60,
                  )
                ],

              );
            }
        ),


        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();textEditingController.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
          TextButton(onPressed: (){setState(() {
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
      BasePage.selectedIcon = Icon(Icons.arrow_drop_down);
      showDialog(context: context, builder: (BuildContext context){return AnimatedContainer(
        curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: BasePage.childAlignment ,

        child: AlertDialog(
        scrollable: true,
        backgroundColor: AppConstants.any,


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
                    controller: toxtOditingCentraller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,15),
                  child: Text('Please select icon for the device',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                IconButton(icon: BasePage.selected ? BasePage.selectedIcon : Icon(Icons.arrow_drop_down), onPressed: ()=>{
                    _pickFavIcon(),
                  if(BasePage.selected != false){
                    setState(() {
                      _showToast(context);
                    }),
              },
                  BasePage.selected == false,
                },color: Colors.white,iconSize: 60,)
              ],);
            }
        ),


        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();toxtOditingCentraller.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
          TextButton(onPressed: (){setState(() {
            FavButtons.favorites.insert(FavButtons.favorites.length,toxtOditingCentraller.text);
            FavButtons.areOn.insert(FavButtons.areOn.length, false);
            FavButtons.favIcons.insert(FavButtons.favIcons.length, BasePage.selectedIcon,);
            BasePage.icons.insert(BasePage.icons.length, BasePage._iconData);

          });
          Navigator.of(context).pop();
          toxtOditingCentraller.text = '';
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
      setState(() {
      });
    }
  }
  


  void _pickZoneIcon() async {
      IconData icon = await FlutterIconPicker.showIconPicker(context, iconPackMode: IconPack.material,);
      if(icon != null){
        setState((){
          ZoneListTile.zoneIcons[_index] = Icon(icon,size: 30);
        });
    }
      _index++;
  }
  void _pickFavIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(context, iconPackMode: IconPack.material,);
    if(icon != null){
      BasePage.selectedIcon = Icon(icon,size: 25,color: Colors.white);
      BasePage.selected = true;
      BasePage._iconData = icon;
    }
    _index++;
  }

  void _showToast (BuildContext context) {
    final String er = BasePage.selected ? 'true' : 'false';
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('prueba'),
        action: SnackBarAction(label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
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
    //textEditingController.dispose();
    //toxtOditingCentraller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                             FavButtons(func: showDialogueFav, isOn: BasePage.isOn,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only( left: 20),
              child: Text('Todas las zonas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
            ),


              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width/1.3,
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


