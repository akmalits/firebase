// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  // String id;
  String numbers;
  dynamic timestamp;

  Item({
    // required this.id,
    required this.numbers,
    required this.timestamp,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        // id: json["id"],
        numbers: json["numbers"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "numbers": numbers,
        "timestamp": timestamp,
      };
}
