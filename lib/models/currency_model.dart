// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  CurrencyModel({
    this.rates,
    this.base,
    this.date,
  });

  Rates rates;
  String base;
  DateTime date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        rates: Rates.fromJson(json["rates"]),
        base: json["base"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "rates": rates.toJson(),
        "base": base,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class Rates {
  Rates({
    this.inr,
  });

  double inr;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        inr: json["USD"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": inr,
      };
}
