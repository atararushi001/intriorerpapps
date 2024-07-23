// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
    List<StateList> states;

    StateModel({
        required this.states,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        states: List<StateList>.from(json["states"].map((x) => StateList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
    };
}

class StateList {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    int countryId;

    StateList({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
        required this.countryId,
    });

    factory StateList.fromJson(Map<String, dynamic> json) => StateList(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        countryId: json["countryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "countryId": countryId,
    };
}
