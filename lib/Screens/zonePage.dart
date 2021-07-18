import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/devicePage.dart';
import 'package:lit/Views/GridWidgets.dart';
import 'package:lit/Views/TextWidgets.dart';

class ZonePage extends StatefulWidget {

  static final String routeName = '/ZonePageRoute';
  static bool isOn = false;

  ZonePage ({Key key}) : super (key: key);

  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appColor,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Container(
                      //color: Colors.greenAccent,
                      height: MediaQuery.of(context).size.height/4,
                      child: Text('Living Room', style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),alignment: Alignment.bottomCenter,),
                  ),

                    GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:10,
                        mainAxisSpacing: 20,
                        childAspectRatio: 3/4,
                      ),
                      itemBuilder: (context, index){
                        return InkResponse(
                          enableFeedback: true,
                          child: DevManagerGridTile(),
                          onTap: ()=>{},
                        );
                      },
                    ),

              ],
            ),
          ),
        ),

    );
  }

}