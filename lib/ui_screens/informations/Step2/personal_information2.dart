import 'package:flutter/material.dart';

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
        backgroundColor: Colors.grey,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    Size size = MediaQuery.of(context).size;
    return Container(
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
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text("Cencel"),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 90, 0, 10),
              child:
                  Text("It's quick and easy.", style: TextStyle(fontSize: 30)),
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
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildProfile(),
                  _buildEmailRow(),
                  _buildPasswordRow(),
                  _buildJob(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: _buildLoginButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text("User Profile"),
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
            Email = value;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            //contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.red,
            ),
            labelText: 'Email'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          labelText: 'Address',
        ),
      ),
    );
  }

  Widget _buildJob() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          setState(() {
            Email = value;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            //contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.red,
            ),
            labelText: 'Job'),
      ),
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
}
