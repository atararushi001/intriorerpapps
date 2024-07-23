// To parse this JSON data, do
//
//     final packages = packagesFromJson(jsonString);

import 'dart:convert';

List<Packages> packagesFromJson(String str) => List<Packages>.from(json.decode(str).map((x) => Packages.fromJson(x)));

String packagesToJson(List<Packages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Packages {
  int id;
  String name;
  String description;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  Packages({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
