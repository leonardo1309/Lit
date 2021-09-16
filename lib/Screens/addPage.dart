
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/IconPack.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Models/Device.dart';
import 'package:lit/Models/Zone.dart';
import 'package:lit/Models/data.dart';

TextEditingController textEditingController = TextEditingController();

class AddPage extends StatefulWidget {

  static final String routeName = '/AddPageRoute';
  static bool isOn = false;
  static Alignment childAlignment = Alignment.center;

  AddPage ({Key key}) : super (key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  Device _device;
  Zona _zone;
  Icon _icon;
  IconData _iconData;
  IconData _iconData2;
  Icon _icon2;
  var idGenerator = new Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0, top: 30.0),
                child: Container(
                  //color: Colors.greenAccent,
                  height: MediaQuery.of(context).size.height/4,
                  child: Text('User Dashboard', style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  alignment: Alignment.center,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: ListTile(
                  leading: Icon(Icons.add_circle, color: Colors.white,),
                  title: Text('Configurar nuevo dispositivo', style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                  onTap: () => {addNewDevice()},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: ListTile(
                  leading: Icon(Icons.account_tree_outlined, color: Colors.white,),
                  title: Text('Configurar nueva zona', style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                  onTap: () => {addNewZone()},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: ListTile(
                  leading: Icon(Icons.wb_twighlight, color: Colors.white,),
                  title: Text('Configurar nueva rutina', style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                  onTap: () => {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: ListTile(
                  leading: Icon(Icons.wine_bar, color: Colors.white,),
                  title: Text('Configurar nueva escena', style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                  onTap: () => {},
                ),
              ),
            ],
          ),
        ),
      );

  }

  void addNewDevice() {

    Zona _selectedZone;

    showDialog(context: this.context, builder: (BuildContext context){return AnimatedContainer(
      curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: AddPage.childAlignment ,

      child: AlertDialog(
        scrollable: true,
        backgroundColor: AppConstants.any,


        title: Text('Configurar nuevo dispositivo',style: TextStyle(
          color: Colors.white,
        ),),



        content: StatefulBuilder(
            builder: (context, setState){
              return Column(children: <Widget>[
                Text('Digite el nombre del dispositivo',style: TextStyle(
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
                  child: Text('Seleccione el ícono para el dispositivo',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: ()=>{
                    _pickDeviceIcon(),
                  },color: Colors.white,iconSize: 60,),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Text('Asignar dispositivo a zona', style: TextStyle(
                  color: Colors.white,
                ),),
                ),
                DropdownButton<Zona>(
                    iconSize: 60,
                    elevation: 12,
                    value: _selectedZone != null ? _selectedZone : (InventedData.listOfZones.length > 0 ? InventedData.listOfZones.first: null),
                  items: InventedData.listOfZones.length > 0 ? InventedData.listOfZones.map<DropdownMenuItem<Zona>>((Zona value) {
                    return DropdownMenuItem<Zona>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList() : null,

                  onChanged: (Zona newZona) {
                    setState((){
                      _selectedZone = newZona;
                    });
                  },
                )
              ],);
            }
        ),


        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();textEditingController.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
          TextButton(onPressed: (){setState(() {

            _device = Device();
            _device.name = textEditingController.text;
            _device.id = idGenerator.nextInt(4).toString();
            _device.isOn = false;
            _device.belongsTo = _selectedZone.name;
            print(_selectedZone.name);
            _device.value = 50;
            _device.icon = _icon2;
            _device.iconData = _iconData2;
            _device.firstUse = true;
            InventedData.listOfDevices.add(_device);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Se ha agregado el dispositivo ${_device.name}, y pertenece a ${_selectedZone.name}"),
            ));


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

  void addNewZone() {

    showDialog(context: this.context, builder: (BuildContext context){return AnimatedContainer(
      curve:Curves.easeOut, duration: Duration(milliseconds: 400),height:200, alignment: AddPage.childAlignment ,

      child: AlertDialog(
        scrollable: true,
        backgroundColor: AppConstants.any,


        title: Text('Configurar nueva Zona',style: TextStyle(
          color: Colors.white,
        ),),



        content: StatefulBuilder(
            builder: (context, setState){
              return Column(children: <Widget>[
                Text('Digite el nombre de la zona',style: TextStyle(
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
                  child: Text('Seleccione el ícono para la zona',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: ()=>{
                    _pickZoneIcon(),
                  },color: Colors.white,iconSize: 60,)
              ],);
            }
        ),


        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();textEditingController.text = '';}, child: Text('Cancel', textAlign:TextAlign.left, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
          TextButton(onPressed: (){setState(() {

            _zone = Zona();
            _zone.name = textEditingController.text;
            _zone.numDevices = 0;
            _zone.icon = _icon;
            _zone.iconData = _iconData;
            InventedData.listOfZones.add(_zone);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Se ha agregado la zona ${_zone.name}"),
            ));

          });
          Navigator.of(context).pop();
          textEditingController.text = '';
          },
            child: Text('Ok', textAlign:TextAlign.right, style: TextStyle(
            color: Colors.white, fontSize: 22,
          ),),),
        ],
        elevation: 12,
      ),
    );
    },
    );
  }

  void _pickDeviceIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(this.context, iconPackMode: IconPack.material,);
    if(icon != null){
      _icon2 = Icon(icon,size: 25,color: Colors.white);
      _iconData2 = icon;
    }
  }

  void _pickZoneIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(this.context, iconPackMode: IconPack.material,);
    if(icon != null){
      _icon = Icon(icon,size: 25);
      _iconData = icon;
    }
  }

}




