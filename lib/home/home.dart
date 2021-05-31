import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget _buildContainer() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AlertNotification(),
          SizedBox(
            height: 10,
          ),
          AlertNotification(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Color(0xFF2A2C38),
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildContainer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertNotification extends StatelessWidget {
  const AlertNotification({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        height: 90,
        width: 385,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            image: AssetImage("assets/images/pic-packages.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 110),
                child: Text(
                    "Dara Money want to start transpotation \nthe package to you."),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    //  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: ListView(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 200,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            /* borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ), */
                                            image: DecorationImage(
                                              alignment: Alignment.centerLeft,
                                              image: AssetImage(
                                                  "assets/images/pic-packages1.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 150,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Dara Money",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.green,
                                                  ),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              Text(
                                                "Up coming!!",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 50,
                                                  left: 80,
                                                ),
                                                child: Container(
                                                  child: Text("+855234344"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 80,
                                              left: 60,
                                            ),
                                            child: Container(
                                              child:
                                                  Text("ទំនិញបងមកពីរប្រទេសចិន"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 180,
                                    color: Colors.grey,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.centerLeft,
                                          image: AssetImage(
                                            "assets/images/pic-packages2.png",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Accept',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: ListView(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 200,
                                                color: Colors.red,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      image: NetworkImage(
                                                          "https://5.imimg.com/data5/XN/DQ/GLADMIN-15081210/parcel-delivery-services-500x500.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: IconButton(
                                                  icon: Icon(Icons.close),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 20,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(
                                                            "IFood & ICoffe",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                "# 24 Jawaharlal Nehru Blvd(215), Phnom Penh, Cambodia\n\nPhnom Penh restaurants are emerging as culinary \nsurprise packages to match larger and more \nestablished Southeast Asian neighbours.\nTraditional Khmer street food surrounds the footpaths \nof haute cuisine restaurants, and cafés and bistros of \nevery variety sprout in alleys and old colonial houses.",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 30),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          margin: EdgeInsets.only(right: 20),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            image: DecorationImage(
                                              alignment: Alignment.topCenter,
                                              image: AssetImage(
                                                "assets/images/package.jpg",
                                              ),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 110),
                                                child: Text(
                                                  "IFood & ICoffe",
                                                ),
                                              ),
                                              Text(
                                                "# 24 Jawaharlal\nNehru Blvd(215)\nRestaurant",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          margin: EdgeInsets.only(right: 20),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            image: DecorationImage(
                                              alignment: Alignment.topCenter,
                                              image: AssetImage(
                                                "assets/images/package.jpg",
                                              ),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 110),
                                                child: Text(
                                                  "IFood & ICoffe",
                                                ),
                                              ),
                                              Text(
                                                "# 24 Jawaharlal\nNehru Blvd(215)\nRestaurant",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          margin: EdgeInsets.only(right: 20),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            image: DecorationImage(
                                              alignment: Alignment.topCenter,
                                              image: AssetImage(
                                                "assets/images/package.jpg",
                                              ),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 110),
                                                child: Text(
                                                  "IFood & ICoffe",
                                                ),
                                              ),
                                              Text(
                                                "# 24 Jawaharlal\nNehru Blvd(215)\nRestaurant",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
