import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/styles/theam.dart';
import 'package:tevta_delivery/ui_screens/forgetPW/verify_code.dart';
import 'package:tevta_delivery/ui_screens/login_screens/login_Page.dart';
import 'package:http/http.dart' as http;

class ForgetPassword extends StatefulWidget {
  @override
  ForgetPasswordState createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  String phoneNumber;
  String smsCode;
  String verificationCode;

  TextEditingController _phoneNumberController = new TextEditingController();
  bool _isLoading = false;

  _checkUser(String email) async {
    if (!email.contains("+")) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: "Warning",
        message: "Invaid Phone number",
        duration: Duration(seconds: 2),
      )..show(context);
    } else {
      setState(() {
        _isLoading = true;
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var response = await http.get(
          Uri.parse(
              "https://tevatadev.9soft.org/api/v1/123456/check-user/$email"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      print(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse["status"] == 1) {
          var userId = jsonResponse["data"]["id"];
          var profile = jsonResponse['data']['profile']['link'];
          var name = jsonResponse['data']['name'];
          print(userId);
          _submit(_phoneNumberController.text, name, profile, userId);
        } else {
          setState(() {
            _isLoading = false;
          });
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            title: "Error",
            message: "Account not found",
            duration: Duration(seconds: 2),
          )..show(context);
        }
        print(response.body);
      } else {
        setState(() {
          _isLoading = false;
        });
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Errro",
          message: "Something when wrong.",
          duration: Duration(seconds: 2),
        )..show(context);
      }
    }
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: 240,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Color(0XffEAF8FE),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Get Benifits on delivery.",
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _buildEmailRow(),
                SizedBox(
                  height: 35,
                ),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Container(
      height: 55,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: _phoneNumberController,
        keyboardType: TextInputType.phone,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: EdgeInsets.only(top: 16),
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                color: primaryColor,
              ),
            ],
          ),
          hintText: 'Phone Number',
          hintStyle: TextStyle(color: Color(0xff7D8EA7)),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 55,
          width: 280,
          child: RaisedButton(
            elevation: 5.0,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              // _submit(_phoneNumber.text);
              _checkUser(_phoneNumberController.text);
            },
            child: Text(
              "Get Verify Code",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _submit(String phoneNumber, String name, String profile, int id) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) {
        print(credential);
        setState(() {
          _isLoading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        setState(() {
          _isLoading = false;
        });
      },
      codeSent: (String verificationId, [int resendToken]) {
        print(verificationId);
        print(resendToken);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VerifycodeResetPW(
              verificationId: verificationId,
              resendToken: resendToken,
              profile: profile,
              name: name,
              id: id,
              phoneNumber: _phoneNumberController.text,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Dont have an account? ',
                style: TextStyle(
                  color: Color(0xff949EAE),
                  fontSize: 17,
                ),
              ),
              TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Color(0xFF2A2C38),
        body: _isLoading
            ? Container(
                color: Colors.white30,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white30,
                ),
              )
            : Container(
                height: size.height,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildLogo(),
                          _buildContainer(),
                          _buildSignUpBtn(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
