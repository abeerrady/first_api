
import 'package:first_api/home_screens/login_screens/controller.dart';
import 'package:flutter/material.dart';

import '../view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginController _loginController = LoginController();
  bool isLoading = false;

  var emailController = TextEditingController();
  var passwordController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp , size:  25 , color: Colors.black,), onPressed: (){Navigator.pop(context);},),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Log in" ,
                  style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold ),),
                SizedBox(height: 30,),
                TextFormField(
                  controller: emailController ,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               hintText: 'Email Address',
               hintStyle: TextStyle(color: Colors.grey)
             ),
                  validator: (String value){


                    if(value.isEmpty) return'email address must not be empty';
                    else if(!value.contains('@')) return'missing@!';
                    else return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController ,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hintText: 'Password ',
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  validator: (String value){
                    if(value.isEmpty) return 'password must not be empty';
                    else if(value.length < 4) return 'Length';
                    else return null;
                  },
                ),
                SizedBox(height: 30,),
                Container(
                  width: 200,
                  height: 50,
                  child: isLoading? Center(child: CircularProgressIndicator(),) : ElevatedButton(
                      onPressed: ()async{
                        if(!formKey.currentState.validate()) return;
                        setState(() {
                          isLoading=true;
                        });
                        final message = await _loginController.login(emailController.text, passwordController.text);
                        if(message !='ok')
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
                        else
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ViewScreen()));
                        setState(() {
                          isLoading=false;
                        });
                      }, child: Text('Login in' , style: TextStyle(color: Colors.white , fontSize: 23),)),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
