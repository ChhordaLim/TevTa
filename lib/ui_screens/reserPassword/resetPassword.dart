import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/styles/theam.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  String phoneNumber, profile, name;
  int id;
  ResetPassword({this.phoneNumber, this.profile, this.name, this.id});
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password_confirmationController =
      TextEditingController();
  bool _isLoading = false;
  bool _isShowpassword = false;

  _forgetPW(String password, String password_confirmation) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'password': password,
      'password_confirmation': password_confirmation,
    };
    var jsonResponse;
    print(password);
    print(password_confirmation);
    setState(() {
      print("login success");
      _isLoading = true;
    });
    var response = await http.post(
        Uri.parse("https://tevatadev.9soft.org/api/v1/123456/forgot-password/" +
            widget.id.toString()),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print("Token: ${response.body}");

      if (jsonResponse["status"] == 1) {
        print("forget password success");
        _login(widget.phoneNumber, _passwordController.text);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  _login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonResponse;
    print(email);
    print(password);
    var response = await http.post(
        Uri.parse("https://tevatadev.9soft.org/api/v1/123456/login"),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print("Token: ${response.body}");

      if (jsonResponse["status"] == 1) {
        setState(() {
          print("login success");
          _isLoading = false;
        });
        print('Token: ${jsonResponse['data']['token']}');
        sharedPreferences.setString("token", jsonResponse['data']['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
            (Route<dynamic> route) => false);
      } else {
        setState(() {
          print("login success");
          _isLoading = false;
        });
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
    return _isLoading
        ? Container(
            color: Colors.white30,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white30,
            ),
          )
        : SingleChildScrollView(
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: primaryColor,
                          ),
                          Text(
                            "Cencel",
                            style: TextStyle(fontSize: 15, color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
                      child: Text(
                        "Reset your password \nand Login.",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff949EAE),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildContainer(),
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
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                height: 450,
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
            Container(
              height: 450,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildProfile(),
                  _buildNewPassword(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildRePassword(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildbutton()
                ],
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
                            height: 20,
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
                                    ))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(
                                0xff707070,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${widget.phoneNumber}",
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff949EAE)),
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
          hintText: 'New Password',
          hintStyle: TextStyle(color: Color(0xff7D8EA7)),
        ),
      ),
    );
  }

  Widget _buildRePassword() {
    return Container(
      height: 55,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: _password_confirmationController,
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
          hintText: 'Re-Password',
          hintStyle: TextStyle(color: Color(0xff7D8EA7)),
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
          width: 280,
          margin: EdgeInsets.only(top: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: _passwordController.text == "" ||
                    _password_confirmationController.text == "" ||
                    _passwordController.text !=
                        _password_confirmationController.text
                ? null
                : () {
                    _forgetPW(_passwordController.text,
                        _password_confirmationController.text);
                  },
            child: Text(
              "Reset password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
