import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/styles/theam.dart';
import 'package:http/http.dart' as http;
import 'package:tevta_delivery/ui_screens/forgetPW/forget_Password.dart';
import 'package:tevta_delivery/ui_screens/login_screens/login_Page.dart';

class AccountExit extends StatefulWidget {
  String profile, name, phoneNumber;
  AccountExit({this.profile, this.name, this.phoneNumber});
  @override
  _AccountExitState createState() => _AccountExitState();
}

class _AccountExitState extends State<AccountExit> {
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isShowpassword = false;
  _login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonResponse = null;
    print(email);
    print(password);
    setState(() {
      print("login success");
      _isLoading = true;
    });
    var response = await http.post(
        Uri.parse("https://tevatadev.9soft.org/api/v1/123456/login"),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print("Token: ${response.body}");
      //tokenId = jsonResponse['token'];
      if (jsonResponse["status"] == 1) {
        setState(() {
          print("login success");
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['data']['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: "Error",
        message: "invalid Username or Password",
        duration: Duration(seconds: 2),
      )..show(context);
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              right: 360,
              child: Image.asset(
                "assets/images/circle.png",
                width: size.width * 0.5,
              ),
            ),
            Positioned(
              bottom: 630,
              right: 10,
              child: Image.asset(
                "assets/images/smallcircle.png",
                width: size.width * 0.5,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 315,
              child: Image.asset(
                "assets/images/mindcircle.png",
                width: size.width * 0.5,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: primaryColor,
                        ),
                        Text(
                          "Cancel",
                          style: TextStyle(fontSize: 15, color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Account Exist \nContinue login as.",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xff949EAE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildContainer(),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget password?",
                          style: TextStyle(fontSize: 15, color: primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Not you?",
                          style: TextStyle(fontSize: 15, color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  color: Color(0xffEAF8FE),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildProfile(),
                    _buildNewPassword(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildbutton()
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildProfile() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.7,
                      color: Color(0xff1DBEFA).withOpacity(0.7),
                    )),
                child: Center(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://tevatadev.9soft.org/api/v1/123456/view-profile/" +
                                      widget.profile,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${widget.phoneNumber}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewPassword() {
    return Container(
      height: 55,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.text,
        obscureText: _isShowpassword,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            child: Icon(Icons.visibility),
            onTap: () {
              setState(() {
                _isShowpassword = !_isShowpassword;
              });
            },
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 16),
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ImageIcon(
              AssetImage("assets/images/icon-password.png"),
              color: primaryColor,
            ),
          ),
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: 250,
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: _passwordController.text == ""
                ? null
                : () {
                    _login(widget.phoneNumber, _passwordController.text);
                  },
            child: Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
