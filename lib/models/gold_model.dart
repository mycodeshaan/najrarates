// To parse this JSON data, do
//
//     final goldModel = goldModelFromJson(jsonString);

import 'dart:convert';

GoldModel goldModelFromJson(String str) => GoldModel.fromJson(json.decode(str));

String goldModelToJson(GoldModel data) => json.encode(data.toJson());

class GoldModel {
  GoldModel({
    this.timestamp,
    this.metal,
    this.currency,
    this.exchange,
    this.symbol,
    this.prevClosePrice,
    this.openPrice,
    this.lowPrice,
    this.highPrice,
    this.openTime,
    this.price,
    this.ch,
    this.chp,
    this.ask,
    this.bid,
  });

  int timestamp;
  String metal;
  String currency;
  String exchange;
  String symbol;
  double prevClosePrice;
  double openPrice;
  double lowPrice;
  double highPrice;
  int openTime;
  double price;
  double ch;
  double chp;
  double ask;
  double bid;

  factory GoldModel.fromJson(Map<String, dynamic> json) => GoldModel(
        timestamp: json["timestamp"],
        metal: json["metal"],
        currency: json["currency"],
        exchange: json["exchange"],
        symbol: json["symbol"],
        prevClosePrice: json["prev_close_price"].toDouble(),
        openPrice: json["open_price"].toDouble(),
        lowPrice: json["low_price"].toDouble(),
        highPrice: json["high_price"].toDouble(),
        openTime: json["open_time"],
        price: json["price"].toDouble(),
        ch: json["ch"].toDouble(),
        chp: json["chp"].toDouble(),
        ask: json["ask"].toDouble(),
        bid: json["bid"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "metal": metal,
        "currency": currency,
        "exchange": exchange,
        "symbol": symbol,
        "prev_close_price": prevClosePrice,
        "open_price": openPrice,
        "low_price": lowPrice,
        "high_price": highPrice,
        "open_time": openTime,
        "price": price,
        "ch": ch,
        "chp": chp,
        "ask": ask,
        "bid": bid,
      };
}
