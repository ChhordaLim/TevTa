import 'package:flutter/material.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/ui_screens/informations/Step1/personal_information1.dart';
import 'package:tevta_delivery/ui_screens/login_screens/login_Page.dart';
import 'package:tevta_delivery/ui_screens/reserPassword/resetPassword.dart';

void main() {
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
