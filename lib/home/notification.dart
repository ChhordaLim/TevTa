import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notfication"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
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
                    Stack(
                      children: [
                        Text(
                          "Dara Money (+855 98 765 432) wants to start \nthe package to you.",
                        ),
                      ],
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
