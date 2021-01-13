import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naijaratesapp/controllers/bitcoin_controller.dart';
import 'package:naijaratesapp/controllers/currency_controller.dart';
import 'package:naijaratesapp/widgets/cryptocard.dart';

class BitcoinScreen extends StatelessWidget {
  final bitcoinController = Get.put(BitcoinController());
  final currencyController = Get.put(CurrencyController());

  final List<String> currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: bitcoinController.currency.value,
      style: TextStyle(color: Colors.white),
      items: dropdownItems,
      onChanged: (value) {
        bitcoinController.currency.value = value;
        bitcoinController.featchBitcoinDetails();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bitcoin Rates",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 1.5,
          ),
          centerTitle: true,
          bottomOpacity: 0.0,
          backgroundColor: Colors.indigoAccent,
        ),
        body: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CryptoCard(
                  cryptoCurrency: "USD",
                  selectedCurrency: bitcoinController.currency.value,
                  value: bitcoinController.isLoading.value
                      ? 0
                      : bitcoinController.bitcoinDetail.value.rate,
                  ngn: currencyController.usdtongnDetail.value.usdNgn),
              // Container(
              //   height: 150.0,
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.only(bottom: 30.0),
              //   color: Colors.indigoAccent,
              //   child: androidDropdown(),
              // ),
            ],
          );
        }));
  }
}
