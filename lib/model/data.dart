// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    Data({
        this.calor,
        this.category,
        this.con,
        this.predicted,
        this.status,
    });

    String? calor;
    String? category;
    String? con;
    String? predicted;
    String? status;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        calor: json["calor"],
        category: json["category"],
        con: json["con"],
        predicted: json["predicted"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "calor": calor,
        "category": category,
        "con": con,
        "predicted": predicted,
        "status": status,
    };
}
