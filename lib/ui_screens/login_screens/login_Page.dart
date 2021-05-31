import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/styles/theam.dart';
import 'package:tevta_delivery/ui_screens/forgetPW/forget_Password.dart';
import 'package:tevta_delivery/ui_screens/signup_screens/signUp_Page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isShowpassword = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String phuneNumber, password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                  _buildForgetPasswordButton(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: _buildSignUpBtn(),
                  ),
                  _buildSocialBtnRow(),
                ],
              )
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

  Widget _buildContainer() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              height: 330,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: Color(0xffEAF8FE),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Getting quick delivery ",
                        style: TextStyle(
                          color: Color(0xff95A8C8),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "TevTa.",
                        style: TextStyle(
                          color: Color(0xff4ADB4A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildEmailRow(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPasswordRow(),
                  SizedBox(
                    height: 35,
                  ),
                  //_buildForgetPasswordButton(),
                  _buildLoginButton(),
                  //_buildSignUpBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailRow() {
    return SingleChildScrollView(
      child: Container(
        height: 55,
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          controller: _phoneController,
          onChanged: (value) {
            setState(() {
              phuneNumber = value;
            });
          },
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
      ),
    );
  }

  Widget _buildPasswordRow() {
    return SingleChildScrollView(
      child: Container(
        height: 55,
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: _passwordController,
          obscureText: _isShowpassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 16),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(Icons.visibility),
                  onTap: () {
                    setState(() {
                      _isShowpassword = !_isShowpassword;
                    });
                  },
                ),
              ],
            ),
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ImageIcon(
                AssetImage("assets/images/icon-password.png"),
                color: primaryColor,
              ),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(color: Color(0xff7D8EA7)),
          ),
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
              MaterialPageRoute(builder: (context) => ForgetPassword()),
            );
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: 17,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 55,
          width: 280,
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed:
                _phoneController.text == "" || _passwordController.text == ""
                    ? null
                    : () {
                        setState(() {
                          _isLoading = true;
                        });
                        _login(_phoneController.text, _passwordController.text);
                      },
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
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
            onTap: () async {
              final GoogleSignInAccount googleUser =
                  await GoogleSignIn().signIn();
              final GoogleSignInAuthentication googleAuth =
                  await googleUser.authentication;

              final credential = GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken);

              await FirebaseAuth.instance.signInWithCredential(credential).then(
                (value) {
                  print(value.user.email);
                  print(value.user.photoURL);
                  print(value.user.phoneNumber);
                  print(value.user.displayName);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              );
              return await FirebaseAuth.instance
                  .signInWithCredential(credential);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
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
        TextButton(
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
                  color: Color(0xff95A8C8),
                  fontSize: 17,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
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
}
