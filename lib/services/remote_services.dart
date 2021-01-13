import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:naijaratesapp/models/bitcoin_model.dart';
import 'package:naijaratesapp/models/currency_model.dart';
import 'package:naijaratesapp/models/gold_model.dart';
import 'package:naijaratesapp/models/usdtongn_model.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<GoldModel> fetechGold() async {
    var response =
        await client.get('https://www.goldapi.io/api/XAU/USD', headers: {
      'x-access-token': 'goldapi-5vo10piukjh8rh5g-io',
      'Content-Type': 'application/json'
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return goldModelFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<UsdtongnModel> getUsdToNgn() async {
    var response = await client.get(
      "https://free.currconv.com/api/v7/convert?q=USD_NGN&compact=ultra&apiKey=84962f474188e22727e5",
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return usdtongnModelFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<CurrencyModel> fetchCurrencyDetails(
      String from, String to) async {
    var response = await client.get(
      "https://api.exchangeratesapi.io/latest?base=$from&symbols=$to",
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return currencyModelFromJson(jsonString);
    } else {
      print("null");
      return null;
    }
  }

  static Future<List<String>> loadCurrencies() async {
    var response = await client.get(
      "https://api.exchangeratesapi.io/latest",
    );
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      Map curMap = jsonString['rates'];
      return curMap.keys.toList();
    } else {
      return null;
    }
  }

  static fetchBitcoin(String currency) async {
    var response = await client.get(
      "https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=5845228B-6084-463B-A321-73B9AA6BBB13",
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return bitcoinModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
