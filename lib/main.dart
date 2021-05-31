import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/ui_screens/forgetPW/forget_Password.dart';
import 'package:tevta_delivery/ui_screens/informations/Step1/personal_information1.dart';
import 'package:tevta_delivery/ui_screens/informations/Step2/personal_information2.dart';
import 'package:tevta_delivery/ui_screens/login_screens/login_Page.dart';
import 'package:tevta_delivery/ui_screens/reserPassword/resetPassword.dart';
import 'package:tevta_delivery/ui_screens/signup_screens/signUp_Page.dart';
import 'package:tevta_delivery/ui_screens/signup_screens/signup_exit.dart';

import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
