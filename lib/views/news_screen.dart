import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:naijaratesapp/views/news_detail_screen.dart';

final List<Map> articles = [
  {
    "title": "Gold price today",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": "Yellow metal trades flat",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
  {
    "title": " Sell on rally towards Rs 49,550",
    "author": "Jonhy Vino",
    "time": "4 min read",
  },
];

class NewsScreen extends StatelessWidget {
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).buttonColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "News",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.5,
            ),
            backgroundColor: Colors.purpleAccent,
            // leading: Icon(Icons.category),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {},
              // )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              indicatorColor: Colors.lightGreen,
              unselectedLabelColor: Colors.cyanAccent,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Gold"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Jewelry"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Diamond"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Silver"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Platinum"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return _buildArticleItem(index);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
              ),
              Container(
                child: Text(""),
              ),
              Container(
                child: Text(""),
              ),
              Container(
                child: Text(""),
              ),
              Container(
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleItem(int index) {
    Map article = articles[index];
    final String sample =
        "https://images.moneycontrol.com/static-mcnews/2020/01/GLD_6-770x433.jpg?impolicy=website&width=770&height=431";
    return GestureDetector(
      onTap: () {
        Get.to(NewsDetailScreem());
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: 90,
              height: 90,
              color: bgColor,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    color: Colors.blue,
                    width: 80.0,
                    child: Image.network(
                      sample,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          article["title"],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor: primaryColor,
                                ),
                              ),
                              WidgetSpan(
                                child: const SizedBox(width: 5.0),
                              ),
                              TextSpan(
                                  text: article["author"],
                                  style: TextStyle(fontSize: 16.0)),
                              WidgetSpan(
                                child: const SizedBox(width: 20.0),
                              ),
                              WidgetSpan(
                                child: const SizedBox(width: 5.0),
                              ),
                              // TextSpan(
                              //   text: article["time"],

                              // ),
                            ],
                          ),
                          style: TextStyle(height: 2.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
