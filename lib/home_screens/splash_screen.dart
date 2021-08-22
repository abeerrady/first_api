import 'dart:async';

import 'package:first_api/home_screens/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screens/login_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getData()async{
    final prefs = await SharedPreferences.getInstance();
    final idToken = prefs.getString('idToken');
    if (idToken == null) Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
    else Navigator.push(context, MaterialPageRoute(builder: (context) => ViewScreen()));
  }
@override
  void initState() {
  getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              width: 250,
              height: 250,
              child: Image.network('https://www.pngall.com/wp-content/uploads/5/Hello-Speech-Bubble.png' , fit: BoxFit.cover,),
            ),
          )
        ],),
    );
  }
}
