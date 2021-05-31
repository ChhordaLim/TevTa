import 'package:flutter/material.dart';
import 'package:tevta_delivery/home/package_details.dart';
import 'package:tevta_delivery/styles/theam.dart';

class PackagePage extends StatefulWidget {
  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Package"),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _index == 0 ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      child: Row(
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                                color:
                                    _index == 0 ? Colors.white : primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _index == 1 ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      child: Row(
                        children: [
                          Text(
                            "Search",
                            style: TextStyle(
                                color:
                                    _index == 1 ? Colors.white : primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _index == 0 ? Home1(context) : Search1(context),
        ],
      ),
    );
  }

  @override
  Widget Home1(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PackageDetail()),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Text(
                          "Dara Money (+855 98 765 432) wants to start \ntransportation the package to you.",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reject',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Accept',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Text(
                        "Dara Money (+855 98 765 432) wants to start \ntransportation the package to you.",
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reject',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Accept',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Up Coming"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Up Coming"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Done"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Done"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Done"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget Search1(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Text(
                        "Dara Money (+855 98 765 432) wants to start \ntransportation the package to you.",
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Remove',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Send',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Up Coming"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Text(
                        "Dara Money (+855 98 765 432) wants to start \ntransportation the package to you.",
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Make as done',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Reject"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Done"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://neilpatel.com/wp-content/uploads/2017/09/image-editing-tools.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Stack(
                        children: [
                          Text(
                            "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Remove"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
