// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
    List<CountryList> countries;

    CountryModel({
        required this.countries,
    });

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        countries: List<CountryList>.from(json["countries"].map((x) => CountryList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    };
}

class CountryList {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    CountryList({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
