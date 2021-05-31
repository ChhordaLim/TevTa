import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/styles/theam.dart';
import 'package:tevta_delivery/ui_screens/informations/Step1/personal_information1.dart';
import 'package:tevta_delivery/ui_screens/reserPassword/resetPassword.dart';

class VerifycodeResetPW extends StatefulWidget {
  String verificationId, phoneNumber, profile, name;
  int resendToken, id;
  VerifycodeResetPW(
      {this.verificationId,
      this.resendToken,
      this.profile,
      this.name,
      this.id,
      this.phoneNumber});
  @override
  _VerifycodeResetPWState createState() => _VerifycodeResetPWState();
}

class _VerifycodeResetPWState extends State<VerifycodeResetPW> {
  String code = "";
  String smsCode;

  var code1 = TextEditingController();
  var code2 = TextEditingController();
  var code3 = TextEditingController();
  var code4 = TextEditingController();
  var code5 = TextEditingController();
  var code6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: primaryColor,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              _buildLogo(),
              _buildBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
      ],
    );
  }

  Widget _buildBox() {
    final node = FocusScope.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text(
              "The Code has been sent",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff707070),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Container(
                height: 55,
                width: 300,
                child: TextFormField(
                  controller: code1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              /* SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextFormField(
                    controller: code2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                        fontSize: 30,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextFormField(
                    controller: code3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                        fontSize: 30,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextFormField(
                    controller: code4,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                        fontSize: 30,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextFormField(
                    controller: code5,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                        fontSize: 30,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextFormField(
                    controller: code6,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                        fontSize: 30,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        if (code1.text.length == 1) {
                          if (code2.text.length == 1) {
                            if (code3.text.length == 1) {
                              if (code4.text.length == 1) {
                                if (code5.text.length == 1) {
                                  /* //recive opt
                                  String otp =
                                      '${code1.text}${code2.text}${code3.text}${code4.text}${code5.text}${code6.text}'; */
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                  ),
                ),
              ), */
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                    ),
                    Text(
                      "Did not get code?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Resend the code to the user");
                      },
                      child: Text(
                        "Re-Send",
                        style: TextStyle(fontSize: 18, color: primaryColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 220,
                  margin: EdgeInsets.only(bottom: 20),
                  child: RaisedButton(
                    elevation: 5.0,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      _verify(code1.text);
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                /* GestureDetector(
                  onTap: () {
                    _verify(code1.text);
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(fontSize: 20, color: primaryColor),
                  ),
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }

  _verify(String otp) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: widget.verificationId, smsCode: otp),
      )
          .then((value) async {
        if (value.user != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResetPassword(
              phoneNumber: widget.phoneNumber,
              profile: widget.profile,
              name: widget.name,
              id: widget.id,
            ),
          ));
          print(true);
        }
      });
    } catch (e) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        title: "Error",
        message: "invalid OTP",
        duration: Duration(seconds: 2),
      )..show(context);
      print(false);
    }
  }
}
