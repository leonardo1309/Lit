import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lit/Models/AppConstants.dart';
import 'package:lit/Screens/allDevicesPage.dart';
import 'addPage.dart';
import 'basePage.dart';

class MainDashboard extends StatefulWidget {

  static final String routeName = '/mainDashboardRoute';
  static int _index = 0;

  MainDashboard({Key key}) : super(key: key);

  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {

  int _selectedIndex = 0;
  double deviceHeight = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    BasePage(),
    AllDevicesPage(),
    AddPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: SizedBox(
        height: deviceHeight=MediaQuery.of(context).size.height/9,
        child: CurvedNavigationBar(key: _bottomNavigationKey, index: 0, height: 65, items: <Widget>[
          Icon(Icons.home_outlined, size: 40, color: Colors.white,),
          Icon(Icons.devices_other_outlined,size: 40,color: Colors.white,),
          Icon(Icons.add_circle_outline_outlined,size: 40,color: Colors.white,),
        ],
          color: AppConstants.appColor,

          backgroundColor: Colors.black12,
          buttonBackgroundColor: Color.fromRGBO(213, 237, 220, 70),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: _onItemTapped,
          letIndexChange: (index) => true,
        ),
      ),

      backgroundColor: AppConstants.appColor,
    );
  }
}