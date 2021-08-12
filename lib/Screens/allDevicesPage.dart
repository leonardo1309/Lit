import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class AllDevicesPage extends StatefulWidget {

  static final String routeName = '/AllDevicesPageRoute';
  static bool isOn = false;
  static double  Intensity = 0;

  AllDevicesPage ({Key key}) : super (key: key);

  @override
  _AllDevicesPageState createState() => _AllDevicesPageState();
}

class _AllDevicesPageState extends State<AllDevicesPage> {


  @override
  Widget build(BuildContext context) {
    SleekCircularSlider slide;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Text('Mueble TV', style: TextStyle(
                fontSize: 36,

              ),),
            ),
            slide = SleekCircularSlider(
              appearance: CircularSliderAppearance(
                size: MediaQuery.of(context).size.height/3,
                customColors: CustomSliderColors(trackColor: Colors.black12, progressBarColor:AppConstants.appBarColor, shadowColor: AppConstants.appBarLighterColor),
                customWidths: CustomSliderWidths(shadowWidth: getShadeWidth(),),
              ),
              onChange: (double value){
                setState(() {
                  OnOff(value);
                });
              },
            ),
          ],
        ),
      );
  }

}

double getShadeWidth () {
  if(AllDevicesPage.isOn == true){
    return 60;
  }else{
    return 0;
  }
}

bool OnOff (double intensity) {
  if(intensity==0){AllDevicesPage.isOn = false;}
  else{AllDevicesPage.isOn = true;}
}