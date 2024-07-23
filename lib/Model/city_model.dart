// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    List<CityList> cities;

    CityModel({
        required this.cities,
    });

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cities: List<CityList>.from(json["cities"].map((x) => CityList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    };
}

class CityList {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    int stateId;

    CityList({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
        required this.stateId,
    });

    factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        stateId: json["stateId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "stateId": stateId,
    };
}
