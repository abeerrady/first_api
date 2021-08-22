import 'package:first_api/home_screens/login_screens/login_view.dart';
import 'package:first_api/home_screens/singup_screen/singup_controller.dart';
import 'package:flutter/material.dart';

class SingUpView extends StatefulWidget {

  @override
  _SingUpViewState createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  SignUpController _signupController = SignUpController();

  bool isLoading = false;

  var emailController = TextEditingController();
  var passwordController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sing Up" ,
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
               Row(
                 children: [
                   Container(
                     width: 150,
                     height: 50,
                     child: isLoading? Center(child: CircularProgressIndicator(),) : ElevatedButton(
                         onPressed: ()async{
                           if(!formKey.currentState.validate()) return;
                           setState(() {
                             isLoading=true;
                           });
                           final message = await _signupController.signup(emailController.text, passwordController.text);
                           if(message !='ok')
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
                           else
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
                           setState(() {
                             isLoading=false;
                           });
                         }, child: Text('Sign Up' , style: TextStyle(color: Colors.white , fontSize: 23),)),
                   ),
                   SizedBox(width: 40,),
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                     },
                       child: Text('Or LogIn' , style: TextStyle(color: Colors.deepPurple , fontSize: 25),)),
                 ],
               )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
