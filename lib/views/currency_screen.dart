import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naijaratesapp/controllers/currency_controller.dart';

class CurrencyScreen extends StatelessWidget {
  final fromTextController = TextEditingController();
  final currencyController = Get.put(CurrencyController());

  Widget _buildDropDownButton(String currencyCategory) {
    return DropdownButton(
      value: currencyCategory,
      items: currencyController.allCurrencies
          .map((String value) => DropdownMenuItem(
                value: value,
                child: Row(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ))
          .toList(),
      onChanged: (String value) {
        if (currencyCategory == currencyController.fromCurrency.value) {
          currencyController.fromCurrency.value = value;
        } else {
          currencyController.toCurrency.value = value;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Currency Rates",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.5,
          ),
          centerTitle: true,
          bottomOpacity: 0.0,
          backgroundColor: Colors.greenAccent,
        ),
        body: Obx(() {
          if (currencyController.isLoading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ListTile(
                      title: TextField(
                        controller: fromTextController,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                      trailing: _buildDropDownButton(
                          currencyController.fromCurrency.value),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: () {
                          currencyController.fetchCurrencyDetails();
                        }),
                    currencyController.currencyDetail.value.rates != null ||
                            fromTextController.text != ""
                        ? ListTile(
                            title: Chip(
                                label: Text(
                              "${double.parse(fromTextController.text) * currencyController.currencyDetail.value.rates.inr * currencyController.usdtongnDetail.value.usdNgn}",
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
