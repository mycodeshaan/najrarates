import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:naijaratesapp/controllers/admob_controller.dart';
import 'package:naijaratesapp/controllers/nav_controller.dart';
import 'package:naijaratesapp/widgets/chart.dart';

class HomeScreen extends StatelessWidget {
  final navController = Get.put(NavController());
  // final admobController = Get.put(AdmobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Aboki Rates"),
            Text(
              "Your Daily Gold, Naira & Bitcoin",
              softWrap: true,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Contact Us"),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Privacy Policy"),
                trailing: Icon(Icons.arrow_right),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // Divider(
          //   height: 2,
          //   color: Colors.black,
          // ),
          FlatButton(
            child: Text(
              "Daily Gold Rates Observer",
              style: TextStyle(fontSize: 25),
            ),
            height: 100,
            onPressed: () {},
          ),
          Container(
            color: Colors.white30,
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text("Current Time/Date"),
                  subtitle: Text("Market Open/Close Stats : Time"),
                ),
                GridView.count(
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.all(10.0),
                  childAspectRatio: 8,
                  mainAxisSpacing: 10,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("asn"), Icon(Icons.arrow_drop_down)],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("ounce"), Icon(Icons.arrow_drop_down)],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("1850.4"), Text("Bid")],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("1852"),
                          Text("Ask"),
                        ],
                      ),
                    ),
                  ],
                ),
                GridView.count(
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.all(10.0),
                  childAspectRatio: 4,
                  mainAxisSpacing: 10,
                  children: [
                    Container(
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("High"),
                                Text("1860"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Low"),
                                Text("1880"),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(Icons.arrow_drop_up)],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("+20.5"),
                                Text("+1.3"),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          FlatButton(
            child: Text(
              "Gold Jewelry Price ",
              style: TextStyle(fontSize: 25),
            ),
            height: 100,
            onPressed: () {},
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ListTile(
                title: Text("24 karats(99.9)"),
                trailing: Text("₦ 10000"),
              ),
              ListTile(
                title: Text("22 karats(91.6)"),
                trailing: Text("₦ 5000"),
              ),
              ListTile(
                title: Text("21 karats(8)"),
                trailing: Text("₦ 4000"),
              ),
            ],
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          FlatButton(
            child: Text(
              "Price Per Design",
              style: TextStyle(fontSize: 25),
            ),
            height: 100,
            onPressed: () {},
          ),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Design",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "Price",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              ListTile(
                title: Text("Brand(Carter)"),
                trailing: Text("₦ 28,000"),
              ),
              ListTile(
                title: Text("Extra(Sets)"),
                trailing: Text("₦ 25,000"),
              ),
              ListTile(
                title: Text("Extra(Pendad)"),
                trailing: Text("₦ 21,000"),
              ),
              ListTile(
                title: Text("Normal Chain"),
                trailing: Text("₦ 20,000"),
              ),
              ListTile(
                title: Text("Cubon Chain"),
                trailing: Text("₦ 20,000"),
              ),
            ],
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          FlatButton(
            child: Text(
              "Gold Jewlry Calc",
              style: TextStyle(fontSize: 25),
            ),
            height: 100,
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Enter Grams :"),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "10.5",
                        border: OutlineInputBorder(),
                        labelText: 'Grams',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Enter Design :"),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "Cuban",
                        border: OutlineInputBorder(),
                        labelText: 'Design',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(
              "Calculator",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.cyan,
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          FlatButton(
            child: Text(
              "Gold Dealers",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            color: Colors.deepOrangeAccent,
            height: 100,
            onPressed: () {},
          ),
          FlatButton(
            child: Text(
              "Buy in Wholesale",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            color: Colors.purpleAccent,
            height: 100,
            onPressed: () {},
          ),
          LineChartSample2(),
          FlatButton(
            child: Text(
              "Gold Rates",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            color: Colors.green,
            height: 100,
            onPressed: () {
              navController.selectedIndex.value = 1;
            },
          ),
          FlatButton(
            child: Text(
              "Currency Rates",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            height: 100,
            color: Colors.blue,
            onPressed: () {
              navController.selectedIndex.value = 2;
            },
          ),
          FlatButton(
            child: Text(
              "Bitcoin Rates",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            height: 100,
            color: Colors.amberAccent,
            onPressed: () {
              navController.selectedIndex.value = 3;
            },
          ),
          FlatButton(
            child: Text(
              "News",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            height: 100,
            color: Colors.pinkAccent,
            onPressed: () {
              navController.selectedIndex.value = 4;
            },
          ),
        ],
      ),
    );
  }
}
