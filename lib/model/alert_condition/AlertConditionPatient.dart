// To parse this JSON data, do
//
//     final alertConditionPatient = alertConditionPatientFromJson(jsonString);

import 'dart:convert';

AlertConditionPatient alertConditionPatientFromJson(String str) => AlertConditionPatient.fromJson(json.decode(str));

String alertConditionPatientToJson(AlertConditionPatient data) => json.encode(data.toJson());

class AlertConditionPatient {
    AlertConditionPatient({
        this.id,
        this.patientId,
        this.color,
        this.title,
        this.message,
        this.datepost,
        this.patient,
    });

    int id;
    int patientId;
    String color;
    String title;
    String message;
    String datepost;
    Patient patient;

    factory AlertConditionPatient.fromJson(Map<String, dynamic> json) => AlertConditionPatient(
        id: json["id"],
        patientId: json["patient_id"],
        color: json["color"],
        title: json["title"],
        message: json["message"],
        datepost: json["datepost"],
        patient: Patient.fromJson(json["patient"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "color": color,
        "title": title,
        "message": message,
        "datepost": datepost,
        "patient": patient.toJson(),
    };
}

class Patient {
    Patient({
        this.id,
        this.nik,
        this.name,
        this.age,
        this.address,
    });

    int id;
    String nik;
    String name;
    int age;
    String address;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        nik: json["nik"],
        name: json["name"],
        age: json["age"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "name": name,
        "age": age,
        "address": address,
    };
}
