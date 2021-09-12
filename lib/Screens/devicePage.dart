import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Models/Device.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class DevicePage extends StatefulWidget {

  static final String routeName = '/DevicePageRoute';
  static bool isOn = false;
  static double  Intensity = 0;
  static int indexx = 0;
  final Device device;

  DevicePage (this.device, {Key key}) : super (key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {

Device _device;

@override
  void initState() {
    this._device = widget.device;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final arguments = ModalRoute.of(context).settings.arguments as Map;
  if(arguments != null) _device = arguments['device'];

    SleekCircularSlider slide;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Align(
             alignment: Alignment.topLeft,
             child: Padding(
               padding: const EdgeInsets.only(top: 50, bottom: 140),
               child: IconButton(onPressed: ()=>{Navigator.pop(context)},
                   icon: Icon(Icons.arrow_back)),
             ),
           ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
                child: Text(_device.name+_device.isOn.toString(), style: TextStyle(
                  fontSize: 36,
            ),),

              ),

        slide = SleekCircularSlider(
          initialValue: _device.firstUse ? 50 : _device.value,
        appearance: CircularSliderAppearance(
          size: MediaQuery.of(context).size.height/3,
          customColors: CustomSliderColors(trackColor: Colors.black12, progressBarColor:AppConstants.appBarColor, shadowColor: AppConstants.appBarLighterColor),
          customWidths: CustomSliderWidths(shadowWidth: getShadeWidth(_device.isOn),),
        ),
        onChange: (double value){
          setState(() {
            _device.value = value;
            OnOff(value,_device);
          });
          _device.firstUse = false;
          //InventedData.listOfDevices[DevicePage.indexx-1].firstUse = _device.firstUse;
        },
    ),
          ],
        ),
      ),
    );
  }

}


double getShadeWidth (bool isOn) {
  if(isOn == true){
    return 60;
  }else{
    return 0;
  }
}

bool OnOff (double intensity, Device device) {
  if(intensity<=5){device.isOn = false;}
  else{device.isOn = true;
  print('hereeeee!!!');
  }
}