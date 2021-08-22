
import 'package:flutter/material.dart';

class PersonDataScreen extends StatelessWidget {

  String name;
  String birthday;
  String img;
  List<String> occupation;
  String status;
  String nickname;
  String portrayed;
  String category;


  PersonDataScreen({this.name , this.birthday , this.img , this.nickname , this.status , this.portrayed , this.occupation , this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back , size: 20, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('$img' ,)
                      , fit: BoxFit.cover),
                ),
              ),
              Text('$name ' , style: TextStyle(color: Colors.black, fontSize: 25),),
              Text('$birthday' , style: TextStyle(color: Colors.black, fontSize: 25),),
              Text('$nickname' , style: TextStyle(color: Colors.black, fontSize: 25),),
              Text('$status' , style: TextStyle(color: Colors.black, fontSize: 25),),
              Text("$occupation ", style: TextStyle(color: Colors.black, fontSize: 25),),
              Text('$portrayed' , style: TextStyle(color: Colors.black, fontSize: 25),),
              Text('$category' , style: TextStyle(color: Colors.black, fontSize: 25),),



            ],
          ),
        ),
      ),
    );
  }
}













