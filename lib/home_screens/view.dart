

import 'package:first_api/home_screens/controller.dart';
import 'package:first_api/home_screens/details.dart';
import 'package:first_api/home_screens/login_screens/login_view.dart';
import 'package:first_api/home_screens/model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  List <ResponseData>data = [];
  bool isLoading = true;

  void getData() async {
    Controller cont = Controller();
    data = await cont.getData();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.signal_cellular_no_sim_outlined),
            onPressed: ()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: isLoading ? Center(child: Text('Loading...' , style: TextStyle(fontSize: 30),)) : ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => DetailsScreen(
                dataItem: data[index],
              ),
          itemCount: data.length,

      ));
  }
}
