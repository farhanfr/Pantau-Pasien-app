// To parse this JSON data, do
//
//     final patientFamily = patientFamilyFromJson(jsonString);

import 'dart:convert';

PatientFamily patientFamilyFromJson(String str) => PatientFamily.fromJson(json.decode(str));

String patientFamilyToJson(PatientFamily data) => json.encode(data.toJson());

class PatientFamily {
    PatientFamily({
        this.nik,
        this.name,
        this.address,
        this.password,
        this.numberPhone,
        this.photo,
    });

    String nik;
    String name;
    String address;
    String password;
    String numberPhone;
    dynamic photo;

    factory PatientFamily.fromJson(Map<String, dynamic> json) => PatientFamily(
        nik: json["nik"],
        name: json["name"],
        address: json["address"],
        password: json["password"],
        numberPhone: json["number_phone"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "nik": nik,
        "name": name,
        "address": address,
        "password": password,
        "number_phone": numberPhone,
        "photo": photo,
    };
}
