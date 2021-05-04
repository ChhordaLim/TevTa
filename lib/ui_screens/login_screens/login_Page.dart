import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tevta_delivery/ui_screens/forgetPW/forget_Password.dart';
import 'package:tevta_delivery/ui_screens/signup_screens/signUp_Page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phuneNumber, password;
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

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Getting quick delivery with TevTa.",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 50,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
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

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPassWord()),
            );
          },
          child: Text("Forgot Password"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 25),
          width: 5 * (MediaQuery.of(context).size.width / 8),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {},
            child: Text(
              "Sign In",
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

  Widget _buildSocialBtnRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
              ),
              child: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
              ),
              child: Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
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
                  text: 'Sign Up',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                  _buildSocialBtnRow(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
