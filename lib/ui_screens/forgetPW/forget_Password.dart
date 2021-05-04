import 'package:flutter/material.dart';
import 'package:tevta_delivery/ui_screens/forgetPW/verify_code.dart';
import 'package:tevta_delivery/ui_screens/login_screens/login_Page.dart';

class ForgetPassWord extends StatefulWidget {
  @override
  ForgetPassWordState createState() => ForgetPassWordState();
}

class ForgetPassWordState extends State<ForgetPassWord> {
  String phuneNumber;
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
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Get Benifits on delivery.",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 50,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildEmailRow(),
                _buildLoginButton(),
                _buildSignUpBtn(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          setState(() {
            phuneNumber = value;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            //contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.red,
            ),
            labelText: 'Phone Number'),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 1.4 * (MediaQuery.of(context).size.height / 25),
            width: 5 * (MediaQuery.of(context).size.width / 8),
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              elevation: 5.0,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifycodeResetPW()),
                );
              },
              child: Text(
                "Get Verify Code",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
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
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Sign In',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
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
        backgroundColor: Color(0xFF2A2C38),
        body: Container(
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
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildLogo(),
                    _buildContainer(),
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
