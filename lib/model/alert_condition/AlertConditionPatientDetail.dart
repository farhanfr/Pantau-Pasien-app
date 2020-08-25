// To parse this JSON data, do
//
//     final alertConditionPatientDetail = alertConditionPatientDetailFromJson(jsonString);

import 'dart:convert';

AlertConditionPatientDetail alertConditionPatientDetailFromJson(String str) => AlertConditionPatientDetail.fromJson(json.decode(str));

String alertConditionPatientDetailToJson(AlertConditionPatientDetail data) => json.encode(data.toJson());

class AlertConditionPatientDetail {
    AlertConditionPatientDetail({
        this.id,
        this.nurseId,
        this.patientId,
        this.nik,
        this.color,
        this.title,
        this.message,
        this.datepost,
    });

    int id;
    int nurseId;
    int patientId;
    String nik;
    String color;
    String title;
    String message;
    String datepost;

    factory AlertConditionPatientDetail.fromJson(Map<String, dynamic> json) => AlertConditionPatientDetail(
        id: json["id"],
        nurseId: json["nurse_id"],
        patientId: json["patient_id"],
        nik: json["nik"],
        color: json["color"],
        title: json["title"],
        message: json["message"],
        datepost: json["datepost"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nurse_id": nurseId,
        "patient_id": patientId,
        "nik": nik,
        "color": color,
        "title": title,
        "message": message,
        "datepost": datepost,
    };
}
