import 'package:flutter/material.dart';
import 'package:tevta_delivery/styles/theam.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildText(),
        _buildContainer(),
      ],
    );
  }

  Widget _buildText() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Container(
            child: Text(
              "Change password",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return Center(
      child: Container(
        height: 450,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/package.jpg"),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ImageIcon(
                      AssetImage("assets/images/icon-password.png"),
                      color: primaryColor,
                    ),
                  ),
                  labelText: 'Old password',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ImageIcon(
                      AssetImage("assets/images/icon-password.png"),
                      color: primaryColor,
                    ),
                  ),
                  labelText: 'New Password',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 55,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ImageIcon(
                      AssetImage("assets/images/icon-password.png"),
                      color: primaryColor,
                    ),
                  ),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 270,
              margin: EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                elevation: 5.0,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {},
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.height / 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
