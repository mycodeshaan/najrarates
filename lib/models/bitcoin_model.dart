// To parse this JSON data, do
//
//     final bitcoinModel = bitcoinModelFromJson(jsonString);

import 'dart:convert';

BitcoinModel bitcoinModelFromJson(String str) =>
    BitcoinModel.fromJson(json.decode(str));

String bitcoinModelToJson(BitcoinModel data) => json.encode(data.toJson());

class BitcoinModel {
  BitcoinModel({
    this.time,
    this.assetIdBase,
    this.assetIdQuote,
    this.rate,
  });

  DateTime time;
  String assetIdBase;
  String assetIdQuote;
  double rate;

  factory BitcoinModel.fromJson(Map<String, dynamic> json) => BitcoinModel(
        time: DateTime.parse(json["time"]),
        assetIdBase: json["asset_id_base"],
        assetIdQuote: json["asset_id_quote"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "asset_id_base": assetIdBase,
        "asset_id_quote": assetIdQuote,
        "rate": rate,
      };
}
