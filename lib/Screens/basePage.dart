import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Models/Device.dart';
import 'package:lit/Models/Zone.dart';
import 'package:lit/Models/data.dart';
import 'package:lit/Views/DeviceButton.dart';
import 'package:lit/Views/ListWidgets.dart';


TextEditingController textEditingController = TextEditingController();
TextEditingController toxtOditingCentraller = TextEditingController();

class BasePage extends StatefulWidget {

  static final String routeName = '/BasePageRoute';
  static var ran = new Random();
  static Icon baseIcon = Icon(Icons.wb_twighlight);




  BasePage({Key key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  var idGenerator = new Random();
  Zona _zone;

  void addZoneFunction() {

      showDialog(context: context, builder: (BuildContext context){return AnimatedContainer(
          curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: Alignment.center ,

        child: AlertDialog(
        scrollable: true,
        backgroundColor: Colors.transparent,


        title: Text('Configurar nueva zona',style: TextStyle(
          color: Colors.white,
        ),),



        content: StatefulBuilder(
            builder: (context, setState){
              return Column(children: <Widget>[
                  //_widgetOptions.elementAt(_selectedIndex),
                  Text('Inserte el nombre para la zona',style: TextStyle(
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
                      hintText: 'Nombre',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                      controller: textEditingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,15),
                    child: Text('Seleccione el icono para la zona',style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                  IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: ()=>{
                    _pickZoneIcon(),
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

            _zone = Zona();
            _zone.name = textEditingController.text;
            _zone.icon = BasePage.baseIcon;

            //ZoneListTile.zones.insert(ZoneListTile.zones.length-1,_zone.name);
            //ZoneListTile.numItems.insert(ZoneListTile.zones.length-1, BasePage.ran.nextInt(6));

            _zone.numDevices = 3;

            InventedData.listOfZones.add(_zone);
            print('Zones length ${InventedData.listOfZones.length.toString()}');

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
  }

  void addFavoriteFunction() {
    Device _selectedDevice;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Si buenas"),
    ));

    print('la putaaa');

    showDialog(context: context, builder: (BuildContext context){return AnimatedContainer(
    curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: Alignment.center,

    child: AlertDialog(
    scrollable: true,
    backgroundColor: AppConstants.any,


    title: Text('Configure favorite device',style: TextStyle(
    color: Colors.white,
    ),),



    content: StatefulBuilder(
    builder: (context, setState){
    return Column(children: <Widget>[
    Text('Please select the device',style: TextStyle(
    color: Colors.white,
    ),),
    Padding(
    padding: const EdgeInsets.fromLTRB(0,25,0,25),
    child: DropdownButton<Device>(
    value: _selectedDevice != null ? _selectedDevice : InventedData.listOfDevices.first,
    items: InventedData.listOfDevices.map<DropdownMenuItem<Device>>((Device value) {
    return DropdownMenuItem<Device>(
    value: value,
    child: Text(value.name),
    );
    }).toList(),

    onChanged: (Device newDevice) {
    setState((){
    _selectedDevice = newDevice;
    });
    },
    ),
    ),
    ],);
    }
    ),


    actions: [
    TextButton(onPressed: (){Navigator.of(context).pop();toxtOditingCentraller.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
    color: Colors.white, fontSize: 22,
    ),),),
    TextButton(onPressed: (){setState(() {

    InventedData.favoriteDevices.add(_selectedDevice);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Se ha agregado el dispositivo a favoritos ${_selectedDevice.name}"),
    ));
    });

    Navigator.of(context).pop();
    toxtOditingCentraller.text = '';
    },
    child: Text('Ok',
    textAlign:TextAlign.right,
    style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    ),),),
    ],
    elevation: 12,
    ),
    );

    },
    );}

  void _pickZoneIcon() async {
    IconData icn = await FlutterIconPicker.showIconPicker(context, iconPackMode: IconPack.material,);
    if(icn != null){
      BasePage.baseIcon = Icon(icn, size: 25,);
    }else {print('icon = null');}
  }




  FocusNode focusnode;
  String hintext = '';

  @override
  void initState() {
    // this._device = widget.device;
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
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AddFavoriteButton(function: addFavoriteFunction,),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            FavoriteButtons(),
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
                    child: Column(
                      children: [
                        ListView.builder (
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: InventedData.listOfZones.length,//ZoneListTile.zones.length,
                            itemBuilder: (context, index){return
                        ZoneButton(function: addZoneFunction, zone: InventedData.listOfZones[index],);}),
                        AddZoneButton(function: addZoneFunction,),
                      ],
                    ),
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


