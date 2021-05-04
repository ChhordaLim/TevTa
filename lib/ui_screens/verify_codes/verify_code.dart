import 'package:flutter/material.dart';

class VerifyPhoneNumber extends StatefulWidget {
  /* final String phoneNumber;

  VerifyPhoneNumber({@required this.phoneNumber}); */

  @override
  _VerifyPhoneNumberState createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
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
              /* NumericPad(
              onNumberSelected: (value) {
                print(value);
                setState(() {
                  if(value != -1){
                    if(code.length < 4){
                      code = code + value.toString();
                    }
                  }
                  else{
                    code = code.substring(0, code.length - 1);
                  }
                  print(code);        
                });
              },
            ), */
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
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text(
              "The Code has been sent SMS to +8551223456" /* + widget.phoneNumber */,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
              buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
              buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
              buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Did not get code? ",
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    print("Resend the code to the user");
                  },
                  child: Text(
                    "Re-Send",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
