// To parse this JSON data, do
//
//     final clients = clientsFromJson(jsonString);

import 'dart:convert';

List<Clients> clientsFromJson(String str) => List<Clients>.from(json.decode(str).map((x) => Clients.fromJson(x)));

String clientsToJson(List<Clients> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clients {
  int id;
  String name;
  String email;
  String phone;
  String address;
  String password;
  String profilePicture;
  String role;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  int cityId;
  City city;

  Clients({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.password,
    required this.profilePicture,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.cityId,
    required this.city,
  });

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    password: json["password"],
    profilePicture: json["profilePicture"],
    role: json["role"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    cityId: json["cityId"],
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "password": password,
    "profilePicture": profilePicture,
    "role": role,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "cityId": cityId,
    "city": city.toJson(),
  };
}

class City {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int stateId;
  State state;

  City({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.stateId,
    required this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    stateId: json["stateId"],
    state: State.fromJson(json["state"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "stateId": stateId,
    "state": state.toJson(),
  };
}

class State {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int countryId;
  Country country;

  State({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.countryId,
    required this.country,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    countryId: json["countryId"],
    country: Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "countryId": countryId,
    "country": country.toJson(),
  };
}

class Country {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
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
