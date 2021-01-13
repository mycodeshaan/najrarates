import 'package:flutter/material.dart';

class NewsDetailScreem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image =
        "https://images.moneycontrol.com/static-mcnews/2020/01/GLD_6-770x433.jpg?impolicy=website&width=770&height=431";
    return Scaffold(
      appBar: AppBar(
        title: Text('Gold price today'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.slideshow,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Gold",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Jan 12, 2021"),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    "Yellow metal trades flat",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite_border),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("20.2k"),
                      SizedBox(
                        width: 16.0,
                      ),
                      Icon(Icons.comment),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("2.2k"),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Due to weakness in the rupee both the precious metals were settled on a positive note in the domestic markets. The dollar index showed a strong rebound from its around three years low due to rising bond yields in the United States, suggest experts.",
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
