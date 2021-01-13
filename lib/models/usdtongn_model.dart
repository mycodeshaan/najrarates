// To parse this JSON data, do
//
//     final usdtongnModel = usdtongnModelFromJson(jsonString);

import 'dart:convert';

UsdtongnModel usdtongnModelFromJson(String str) =>
    UsdtongnModel.fromJson(json.decode(str));

String usdtongnModelToJson(UsdtongnModel data) => json.encode(data.toJson());

class UsdtongnModel {
  UsdtongnModel({
    this.usdNgn,
  });

  double usdNgn;

  factory UsdtongnModel.fromJson(Map<String, dynamic> json) => UsdtongnModel(
        usdNgn: json["USD_NGN"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD_NGN": usdNgn,
      };
}
