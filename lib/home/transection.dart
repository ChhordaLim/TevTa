import 'package:flutter/material.dart';

class TransectionPage extends StatefulWidget {
  TransectionPage({Key key}) : super(key: key);

  @override
  _TransectionPageState createState() => _TransectionPageState();
}

class _TransectionPageState extends State<TransectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transection"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
