// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

List<Projects> projectsFromJson(String str) => List<Projects>.from(json.decode(str).map((x) => Projects.fromJson(x)));

String projectsToJson(List<Projects> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Projects {
  int id;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  dynamic totalAmount;
  dynamic currentlyPaidAmount;
  dynamic leftAmount;
  dynamic locationAuto;
  String locationManual;
  String status;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic clientId;
  dynamic packageId;
  dynamic designerId;
  dynamic headCarpenterId;
  dynamic createdById;
  Package? package;
  Client? client;
  Client? designer;
  Client? headCarpenter;

  Projects({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.totalAmount,
    required this.currentlyPaidAmount,
    required this.leftAmount,
    required this.locationAuto,
    required this.locationManual,
    required this.status,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.clientId,
    required this.packageId,
    required this.designerId,
    required this.headCarpenterId,
    required this.createdById,
    required this.package,
    required this.client,
    required this.designer,
    required this.headCarpenter,
  });

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    totalAmount: json["total_amount"],
    currentlyPaidAmount: json["currently_paid_amount"],
    leftAmount: json["left_amount"],
    locationAuto: json["location_auto"],
    locationManual: json["location_manual"],
    status: json["status"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    clientId: json["client_id"],
    packageId: json["packageId"],
    designerId: json["designer_id"],
    headCarpenterId: json["head_carpenter_id"],
    createdById: json["created_by_id"],
    package: json["Package"] == null ? null : Package.fromJson(json["Package"]),
    client: json["Client"] == null ? null : Client.fromJson(json["Client"]),
    designer: json["Designer"] == null ? null : Client.fromJson(json["Designer"]),
    headCarpenter: json["HeadCarpenter"] == null ? null : Client.fromJson(json["HeadCarpenter"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "total_amount": totalAmount,
    "currently_paid_amount": currentlyPaidAmount,
    "left_amount": leftAmount,
    "location_auto": locationAuto,
    "location_manual": locationManual,
    "status": status,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "client_id": clientId,
    "packageId": packageId,
    "designer_id": designerId,
    "head_carpenter_id": headCarpenterId,
    "created_by_id": createdById,
    "Package": package?.toJson(),
    "Client": client?.toJson(),
    "Designer": designer?.toJson(),
    "HeadCarpenter": headCarpenter?.toJson(),
  };
}

class Client {
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

  Client({
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
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
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
  };
}

class Package {
  int id;
  String name;
  String description;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  Package({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
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
