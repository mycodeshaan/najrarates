import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naijaratesapp/controllers/currency_controller.dart';
import 'package:naijaratesapp/controllers/gold_controller.dart';

class GoldScreen extends StatelessWidget {
  final goldController = Get.put(GoldController());
  final currencyController = Get.put(CurrencyController());
  Widget _showCurrencies() {
    return DropdownButton<String>(
      items: ['a', 'b'].map((String element) {
        return DropdownMenuItem<String>(
          value: element,
          child: Text(element),
        );
      }).toList(),
      onChanged: (String value) {
        // setState(() {
        //   current = value;
        //   data = null;
        //   data = Network2().fetData(current);
        // });
        // print(value);
      },
      value: "hi",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gold Rates",
          style: TextStyle(color: Colors.white),
          textScaleFactor: 1.5,
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        backgroundColor: Colors.amberAccent,
        actions: [
          // _showCurrencies(),
        ],
      ),
      body: ListView(children: <Widget>[
        Obx(() {
          if (goldController.isLoading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          var goldDetail = goldController.goldDetail.value;
          var ngncurrency = currencyController.usdtongnDetail.value.usdNgn;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Colors.cyanAccent[100],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.limeAccent[100], Colors.orangeAccent]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5.0,
                        blurRadius: 20.0)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("GOLD",
                            textScaleFactor: 3.0,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("₦" + " ${goldDetail.price * ngncurrency}/gram",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 70.0,
                      height: 60.0,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: <
                              Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 4.0),
                          child: Material(
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 10.0,
                            shadowColor: Colors.deepOrange,
                            child: Container(
                                height: 10.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Previous price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Text(
                                          " ${goldDetail.prevClosePrice * ngncurrency}/gram"),
                                    ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 4.0),
                          child: Material(
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 10.0,
                            shadowColor: Colors.deepOrange,
                            child: Container(
                                height: 10.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Open price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Text(
                                          " ${goldDetail.openPrice * ngncurrency}/gram"),
                                    ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 4.0),
                          child: Material(
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 10.0,
                            shadowColor: Colors.deepOrange,
                            child: Container(
                                height: 10.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Low price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Text(
                                          " ${goldDetail.lowPrice * ngncurrency}/gram"),
                                    ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 4.0),
                          child: Material(
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 10.0,
                            shadowColor: Colors.deepOrange,
                            child: Container(
                                height: 10.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("High price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Text(
                                          " ${goldDetail.highPrice * ngncurrency}/gram"),
                                    ])),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 5.0, vertical: 4.0),
                        //   child: Material(
                        //     color: Colors.amber[300],
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(10.0)),
                        //     elevation: 10.0,
                        //     shadowColor: Colors.deepOrange,
                        //     child: Container(
                        //         height: 10.0,
                        //         child: Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Spacer(flex: 4),
                        //               Text("Timestamp",
                        //                   style: TextStyle(
                        //                       fontWeight: FontWeight.bold,
                        //                       fontStyle: FontStyle.italic)),
                        //               Spacer(flex: 3),
                        //               Text(
                        //                 "${goldDetail.timestamp * ngncurrency}",
                        //                 textScaleFactor: 0.7,
                        //               ),
                        //               Spacer(flex: 2),
                        //               Text(
                        //                 "time",
                        //                 textScaleFactor: 0.6,
                        //               ),
                        //               Spacer(flex: 1)
                        //             ])),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 4.0),
                          child: Material(
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 10.0,
                            shadowColor: Colors.deepOrange,
                            child: Container(
                                height: 10.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("ch",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Text("${goldDetail.ch}"),
                                    ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 4.0),
                          child: Material(
                            color: Colors.amber[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 10.0,
                            shadowColor: Colors.deepOrange,
                            child: Container(
                                height: 10.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("chp",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic)),
                                      Text("${goldDetail.chp}"),
                                    ])),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          );
        }),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //       height: 150.0,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //           color: Colors.cyanAccent[100],
        //           gradient: LinearGradient(
        //               begin: Alignment.topLeft,
        //               end: Alignment.bottomRight,
        //               colors: [
        //                 Colors.grey,
        //                 Colors.blueGrey,
        //               ]),
        //           boxShadow: [
        //             BoxShadow(
        //                 color: Colors.black,
        //                 spreadRadius: 5.0,
        //                 blurRadius: 20.0)
        //           ]),
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: <Widget>[
        //                   Text("SILVER",
        //                       textScaleFactor: 3.0,
        //                       style: TextStyle(fontWeight: FontWeight.bold)),
        //                   Text("currency " + "price/gram",
        //                       textScaleFactor: 1.3,
        //                       style: TextStyle(fontWeight: FontWeight.bold))
        //                 ],
        //               ),
        //             ),
        //             Container(
        //                 width: MediaQuery.of(context).size.width - 70.0,
        //                 height: 60.0,
        //                 child: ListView(
        //                     scrollDirection: Axis.horizontal,
        //                     children: <Widget>[
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 5.0, vertical: 4.0),
        //                         child: Material(
        //                           color: Colors.white70,
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10.0)),
        //                           elevation: 5.0,
        //                           shadowColor: Colors.blueGrey,
        //                           child: Container(
        //                               height: 10.0,
        //                               child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: <Widget>[
        //                                     Text("Previous price",
        //                                         style: TextStyle(
        //                                             fontWeight: FontWeight.bold,
        //                                             fontStyle:
        //                                                 FontStyle.italic)),
        //                                     Text("price/gram"),
        //                                   ])),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 5.0, vertical: 4.0),
        //                         child: Material(
        //                           color: Colors.white70,
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10.0)),
        //                           elevation: 5.0,
        //                           shadowColor: Colors.blueGrey,
        //                           child: Container(
        //                               height: 10.0,
        //                               child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: <Widget>[
        //                                     Spacer(flex: 4),
        //                                     Text("Timestamp",
        //                                         style: TextStyle(
        //                                             fontWeight: FontWeight.bold,
        //                                             fontStyle:
        //                                                 FontStyle.italic)),
        //                                     Spacer(flex: 3),
        //                                     Text(
        //                                       "time",
        //                                       textScaleFactor: 0.7,
        //                                     ),
        //                                     Spacer(flex: 2),
        //                                     Text(
        //                                       "time",
        //                                       textScaleFactor: 0.6,
        //                                     ),
        //                                     Spacer(flex: 1)
        //                                   ])),
        //                         ),
        //                       ),
        //                     ])),
        //           ])),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //       height: 150.0,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //           gradient: LinearGradient(
        //               begin: Alignment.topLeft,
        //               end: Alignment.bottomRight,
        //               colors: [
        //                 Colors.blue[200],
        //                 Colors.indigoAccent[100],
        //               ]),
        //           boxShadow: [
        //             BoxShadow(
        //                 color: Colors.black,
        //                 spreadRadius: 5.0,
        //                 blurRadius: 20.0)
        //           ]),
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: <Widget>[
        //                   Text("PLATINUM",
        //                       textScaleFactor: 3.0,
        //                       style: TextStyle(fontWeight: FontWeight.bold)),
        //                   Text("price/gram",
        //                       textScaleFactor: 0.8,
        //                       style: TextStyle(fontWeight: FontWeight.bold))
        //                 ],
        //               ),
        //             ),
        //             Container(
        //                 width: MediaQuery.of(context).size.width - 70.0,
        //                 height: 60.0,
        //                 child: ListView(
        //                     scrollDirection: Axis.horizontal,
        //                     children: <Widget>[
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 5.0, vertical: 4.0),
        //                         child: Material(
        //                           color: Colors.blueAccent[100],
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10.0)),
        //                           elevation: 5.0,
        //                           shadowColor: Colors.red,
        //                           child: Container(
        //                               height: 10.0,
        //                               child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: <Widget>[
        //                                     Text("Previous price",
        //                                         style: TextStyle(
        //                                             fontWeight: FontWeight.bold,
        //                                             fontStyle:
        //                                                 FontStyle.italic)),
        //                                     Text("close price/gram"),
        //                                   ])),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 5.0, vertical: 4.0),
        //                         child: Material(
        //                           color: Colors.blueAccent[100],
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10.0)),
        //                           elevation: 5.0,
        //                           shadowColor: Colors.red,
        //                           child: Container(
        //                               height: 10.0,
        //                               child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: <Widget>[
        //                                     Spacer(flex: 4),
        //                                     Text("Timestamp",
        //                                         style: TextStyle(
        //                                             fontWeight: FontWeight.bold,
        //                                             fontStyle:
        //                                                 FontStyle.italic)),
        //                                     Spacer(flex: 3),
        //                                     Text(
        //                                       "price",
        //                                       textScaleFactor: 0.7,
        //                                     ),
        //                                     Spacer(flex: 2),
        //                                     Text(
        //                                       "price",
        //                                       textScaleFactor: 0.6,
        //                                     ),
        //                                     Spacer(flex: 1)
        //                                   ])),
        //                         ),
        //                       ),
        //                     ])),
        //           ])),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //       height: 150.0,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //           gradient: LinearGradient(
        //               begin: Alignment.topLeft,
        //               end: Alignment.bottomRight,
        //               colors: [
        //                 Colors.red[400],
        //                 Colors.pinkAccent[100],
        //               ]),
        //           boxShadow: [
        //             BoxShadow(
        //                 color: Colors.black,
        //                 spreadRadius: 5.0,
        //                 blurRadius: 20.0)
        //           ]),
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: <Widget>[
        //                   Text("PALLADIUM",
        //                       textScaleFactor: 2.5,
        //                       style: TextStyle(fontWeight: FontWeight.bold)),
        //                   Text("currency : " + "price/gram",
        //                       textScaleFactor: 1.0,
        //                       style: TextStyle(fontWeight: FontWeight.bold))
        //                 ],
        //               ),
        //             ),
        //             Container(
        //                 width: MediaQuery.of(context).size.width - 70.0,
        //                 height: 60.0,
        //                 child: ListView(
        //                     scrollDirection: Axis.horizontal,
        //                     children: <Widget>[
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 5.0, vertical: 4.0),
        //                         child: Material(
        //                           color: Colors.red[200],
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10.0)),
        //                           elevation: 5.0,
        //                           shadowColor: Colors.blueAccent,
        //                           child: Container(
        //                               height: 10.0,
        //                               child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: <Widget>[
        //                                     Text("Previous price",
        //                                         style: TextStyle(
        //                                             fontWeight: FontWeight.bold,
        //                                             fontStyle:
        //                                                 FontStyle.italic)),
        //                                     Text("prev close price/gram"),
        //                                   ])),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 5.0, vertical: 4.0),
        //                         child: Material(
        //                           color: Colors.red[200],
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10.0)),
        //                           elevation: 5.0,
        //                           shadowColor: Colors.blueAccent,
        //                           child: Container(
        //                               height: 10.0,
        //                               child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: <Widget>[
        //                                     Spacer(flex: 4),
        //                                     Text("Timestamp",
        //                                         style: TextStyle(
        //                                             fontWeight: FontWeight.bold,
        //                                             fontStyle:
        //                                                 FontStyle.italic)),
        //                                     Spacer(flex: 3),
        //                                     Text(
        //                                       "time",
        //                                       textScaleFactor: 0.7,
        //                                     ),
        //                                     Spacer(flex: 2),
        //                                     Text(
        //                                       "time",
        //                                       textScaleFactor: 0.6,
        //                                     ),
        //                                     Spacer(flex: 1)
        //                                   ])),
        //                         ),
        //                       ),
        //                     ])),
        //           ])),
        // ),
      ]),
    );
  }
}
