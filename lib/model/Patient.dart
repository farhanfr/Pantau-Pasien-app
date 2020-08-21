// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
    Patient({
        this.id,
        this.hospitalId,
        this.doctorId,
        this.nurseId,
        this.nik,
        this.name,
        this.age,
        this.address,
        this.numberPhone,
        this.dateInpatient,
        this.hospital,
    });

    int id;
    int hospitalId;
    int doctorId;
    int nurseId;
    String nik;
    String name;
    int age;
    String address;
    String numberPhone;
    DateTime dateInpatient;
    Hospital hospital;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        hospitalId: json["hospital_id"],
        doctorId: json["doctor_id"],
        nurseId: json["nurse_id"],
        nik: json["nik"],
        name: json["name"],
        age: json["age"],
        address: json["address"],
        numberPhone: json["number_phone"],
        dateInpatient: DateTime.parse(json["date_inpatient"]),
        hospital: Hospital.fromJson(json["hospital"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_id": hospitalId,
        "doctor_id": doctorId,
        "nurse_id": nurseId,
        "nik": nik,
        "name": name,
        "age": age,
        "address": address,
        "number_phone": numberPhone,
        "date_inpatient": "${dateInpatient.year.toString().padLeft(4, '0')}-${dateInpatient.month.toString().padLeft(2, '0')}-${dateInpatient.day.toString().padLeft(2, '0')}",
        "hospital": hospital.toJson(),
    };
}

class Hospital {
    Hospital({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
