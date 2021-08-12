import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Views/GridWidgets.dart';

class AddPage extends StatefulWidget {

  static final String routeName = '/AddPageRoute';
  static bool isOn = false;

  AddPage ({Key key}) : super (key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      );

  }

}