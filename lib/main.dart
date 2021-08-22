import 'package:first_api/home_screens/login_screens/login_view.dart';
import 'package:first_api/home_screens/view.dart';
import 'package:flutter/material.dart';

import 'home_screens/singup_screen/singup_view.dart';
import 'home_screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SingUpView(),
    );
  }
}

