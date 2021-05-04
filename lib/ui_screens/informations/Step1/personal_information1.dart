import 'package:flutter/material.dart';

class PersonalProfile1 extends StatefulWidget {
  @override
  _PersonalProfile1PageState createState() => _PersonalProfile1PageState();
}

class _PersonalProfile1PageState extends State<PersonalProfile1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              padding: const EdgeInsets.fromLTRB(30, 60, 0, 10),
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildProfile(),
                  _buildEmailRow(),
                  _buildPasswordRow(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildRadioBotton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildNextBotton(),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text("User Profile"),
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
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {},
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            //contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.red,
            ),
            labelText: 'User Name*'),
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
          labelText: 'Birth Date*',
        ),
      ),
    );
  }

  Color bulbColor = Colors.black;
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
                    setState(() {});
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
                    setState(() {});
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
                    setState(() {});
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
      height: 1.4 * (MediaQuery.of(context).size.height / 25),
      width: 5 * (MediaQuery.of(context).size.width / 10),
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        elevation: 5.0,
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {},
        child: Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: MediaQuery.of(context).size.height / 40,
          ),
        ),
      ),
    );
  }
}
