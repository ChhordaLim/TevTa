import 'package:flutter/material.dart';
import 'package:tevta_delivery/home/home_page.dart';
import 'package:tevta_delivery/styles/theam.dart';

class PersonalProfile2 extends StatefulWidget {
  @override
  _PersonalProfile2PageState createState() => _PersonalProfile2PageState();
}

class _PersonalProfile2PageState extends State<PersonalProfile2> {
  String Email;
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
                        style: TextStyle(color: primaryColor, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
                child: Text(
                  "It's quick and easy.",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff949EAE),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
            height: 400,
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
                  height: 25,
                ),
                _buildEmailRow(),
                SizedBox(
                  height: 20,
                ),
                _buildPasswordRow(),
                SizedBox(
                  height: 20,
                ),
                _buildJob(),
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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: EdgeInsets.only(top: 8),
          hintText: 'Email',
          hintStyle: TextStyle(

            color: Color(0xff7D8EA7),
          ),
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
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,

        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 8),
          hintText: 'Address',
          hintStyle: TextStyle(
            fontSize: 15,
            color: Color(0xff7D8EA7),
          ),
        ),
      ),
    );
  }

  Widget _buildJob() {
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
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 8),

          hintText: 'Job',
          hintStyle: TextStyle(
            fontSize: 15,
            color: Color(0xff7D8EA7),
          ),
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
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
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
        ),
      ],
    );
  }
}
