// To parse this JSON data, do
//
//     final alertConditionPatient = alertConditionPatientFromJson(jsonString);

import 'dart:convert';

AlertConditionPatient alertConditionPatientFromJson(String str) => AlertConditionPatient.fromJson(json.decode(str));

String alertConditionPatientToJson(AlertConditionPatient data) => json.encode(data.toJson());

class AlertConditionPatient {
    AlertConditionPatient({
        this.id,
        this.nurseId,
        this.patientId,
        this.nik,
        this.color,
        this.title,
        this.message,
        this.datepost,
        this.patient,
        this.nurse,
    });

    int id;
    int nurseId;
    int patientId;
    String nik;
    String color;
    String title;
    String message;
    String datepost;
    Patient patient;
    Nurse nurse;

    factory AlertConditionPatient.fromJson(Map<String, dynamic> json) => AlertConditionPatient(
        id: json["id"],
        nurseId: json["nurse_id"],
        patientId: json["patient_id"],
        nik: json["nik"],
        color: json["color"],
        title: json["title"],
        message: json["message"],
        datepost: json["datepost"],
        patient: Patient.fromJson(json["patient"]),
        nurse: Nurse.fromJson(json["nurse"]),
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
        "patient": patient.toJson(),
        "nurse": nurse.toJson(),
    };
}

class Nurse {
    Nurse({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Nurse.fromJson(Map<String, dynamic> json) => Nurse(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
