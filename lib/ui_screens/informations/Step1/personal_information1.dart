import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tevta_delivery/styles/theam.dart';
import 'package:tevta_delivery/ui_screens/informations/Step2/personal_information2.dart';
import 'package:tevta_delivery/ui_screens/verify_codes/verify_code.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

enum SingingCharacter { Male, Female, Onther }

class PersonalProfile1 extends StatefulWidget {
  String phoneNumber;
  PersonalProfile1({this.phoneNumber});
  @override
  _PersonalProfile1PageState createState() => _PersonalProfile1PageState();
}

class _PersonalProfile1PageState extends State<PersonalProfile1> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _dobController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  String _date = "";
  SingingCharacter _character = SingingCharacter.Male;

  bool _isLoading = false;
bool _isShowpassword = false;
  _login(
    String name,
    String dob,
    String password,
    String email,
    String _gender,
    /* String player_id,
    String role_id,
    String is_social_media,
    String password_comfirmation, */
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> data = {
      'email': widget.phoneNumber,
      'name': name,
      'dob': dob,
      'password': password,
      'gender': _gender,
      'player_id': '234232',
      'role_id': '2',
      'is_social_media': '0',
      'password_confirmation': password,
    };
    var jsonResponse;
    print(name);
    print(dob);
    print(password);
    print(widget.phoneNumber);
    print(_gender);
    setState(() {
      print("login success");
      _isLoading = true;
    });
    var response = await http.post(
        Uri.parse("https://tevatadev.9soft.org/api/v1/123456/register"),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print("Token: ${response.body}");
      //tokenId = jsonResponse['token'];
      if (jsonResponse['status'] == 1) {
        setState(() {
          print("sign up success");
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['data']['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => PersonalProfile2(),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Error",
          message: "Account exist",
          duration: Duration(seconds: 2),
        )..show(context);
        /*  Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AccountExit()),
        ); */
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          //alignment: Alignment.center,
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
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => VerifyPhoneNumber(),
                  ),
                );
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
                padding: const EdgeInsets.fromLTRB(30, 60, 0, 10),
                child: Text(
                  "It's quick and easy.",
                  style: TextStyle(fontSize: 24, color: Color(0xff949EAE)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                _buildContainer(),
              ],
            ),
          ],
        ),
      ),
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
            height: 600,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Color(0xffEAF8FE),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildProfile(),
                SizedBox(
                  height: 20,
                ),
                _buildEmailRow(),
                SizedBox(
                  height: 20,
                ),
                _buildPasswordRow(),
                SizedBox(
                  height: 20,
                ),
                _buildPassword(),
                SizedBox(
                  height: 20,
                ),
                _buildRadioBotton(),
                SizedBox(
                  height: 20,
                ),
                _buildNextBotton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        Text(
          "User Profile",
          style: TextStyle(
            fontSize: 17,
            color: Color(0xff95A8C8),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    //right: 0,
                    left: 60,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: primaryColor,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        textAlign: TextAlign.center,
        controller: _userNameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 8),

          hintText: 'User Name*',
          hintStyle: TextStyle(color: Color(0xff7D8EA7)),
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Container(
      height: 55,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        onTap: () {
          DatePicker.showDatePicker(context,
              theme: DatePickerTheme(
                  containerHeight: 210.0,
                  backgroundColor: primaryColor,
                  headerColor: Colors.white,
                  cancelStyle: TextStyle(color: primaryColor),
                  doneStyle: TextStyle(color: Colors.blue[600]),
                  itemStyle: TextStyle(color: Colors.white)),
              showTitleActions: true,
              minTime: DateTime(1000, 1, 1),
              maxTime: DateTime(2020, 10, 30), onConfirm: (date) {
            print('confirm $date');
            _date = '${date.year}-${date.month}-${date.day}';
            _dobController.text = _date;
            setState(() {});
          }, currentTime: DateTime.now(), locale: LocaleType.en);
        },

        textAlign: TextAlign.center,
        controller: _dobController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 8),
          border: InputBorder.none,
          hintText: ("Birth of data*"),
          hintStyle: TextStyle(color: Color(0xff7D8EA7)),

        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      height: 55,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        controller: _passwordController,
        obscureText: _isShowpassword,
        
        decoration: InputDecoration(
          suffixIcon: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.visibility),
              ],
            ),
            onTap: (){
              setState(() {
                _isShowpassword = !_isShowpassword;

              });
            },
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 17, left: 40),
          hintText: 'Password',
          hintStyle: TextStyle(color: Color(0xff7D8EA7)),
        ),
      ),
    );
  }

  Color bulbColor = Colors.black;
  var index = -1;
  String gender = 'Male';
  Widget _buildRadioBotton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Radio(
                  value: Colors.red,
                  groupValue: bulbColor,
                  onChanged: (val) {
                    bulbColor = val;
                    setState(() {
                      gender = 'Male';
                    });
                  }),
              Text(
                'Male',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Radio(
                  value: Colors.blue,
                  groupValue: bulbColor,
                  onChanged: (val) {
                    bulbColor = val;
                    setState(() {
                      gender = 'Female';
                    });
                  }),
              Text('Female', style: TextStyle(fontSize: 15))
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Radio(
                  value: Colors.green,
                  groupValue: bulbColor,
                  onChanged: (val) {
                    bulbColor = val;
                    setState(() {
                      gender = "Onther";
                    });
                  }),
              Text('Onther', style: TextStyle(fontSize: 15))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNextBotton() {
    return Container(
      height: 55,
      width: 280,
      child: RaisedButton(
        elevation: 5.0,
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: _userNameController.text == "" ||
                _dobController.text == "" ||
                _passwordController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                _login(
                  _userNameController.text,
                  _dobController.text,
                  _passwordController.text,
                  _emailController.text,
                  gender,
                );
              },
        child: Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
