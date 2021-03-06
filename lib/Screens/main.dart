import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/allDevicesPage.dart';
import 'package:lit/Screens/devicePage.dart';
import 'package:lit/Screens/mainDashboard.dart';
import 'package:lit/Screens/zonePage.dart';
import 'package:lit/Models/Device.dart';
import 'package:provider/provider.dart';
import 'addPage.dart';
import 'basePage.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => Device(),
    child: MyApp(),
    ),
);

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Device device;
    return MaterialApp(
      title: 'Lit',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
      routes: {
        MainDashboard.routeName: (context) => MainDashboard(),
        BasePage.routeName: (context) => BasePage(),
        AllDevicesPage.routeName: (context) => AllDevicesPage(),
        AddPage.routeName: (context) => AddPage(),
        ZonePage.routeName: (context) => ZonePage(),
        DevicePage.routeName: (context) => DevicePage(device),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Timer(Duration(seconds: 1), (){
      Navigator.pushNamed(this.context, MainDashboard.routeName);
    });
    super.initState();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.lightbulb_outline,
              size: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('${AppConstants.appName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),

    );
  }
}
