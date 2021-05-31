import 'package:flutter/material.dart';
import 'package:tevta_delivery/home/billing.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
          ),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Dara Money',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Edit",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Send",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillingPage(),
                      ),
                    );
                  },
                  leading: Icon(Icons.payment),
                  title: Text('Billing & Plan'),
                ),
                ListTile(
                  leading: Icon(Icons.ad_units_outlined),
                  title: Text('Ads Form'),
                ),
                ListTile(
                  leading: Icon(Icons.report),
                  title: Text('Report'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.security),
                  title: Text('Security'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
