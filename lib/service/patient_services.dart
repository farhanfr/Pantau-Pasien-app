import 'dart:convert';

import 'package:http/http.dart';
import 'package:pantau_pasien/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientServices {
  final String url = "http://192.168.1.13:8000/api/v1/patient";
  Client client = Client();

  Future<List<Patient>> getPatientByNik() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nik = prefs.getString("nik");
    List<Patient> _list = [];
    final response = await client.get("$url/get/all/nik/?nik=$nik");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      print(map);
      if (map["status"] == true) {
        List<dynamic> data = map["data"];
        for (Map i in data) {
          _list.add(Patient.fromJson(i));
          // print("ISI $i");
        }
      }
      return _list;
    } else {
      return null;
    }
  }

  Future<int> getCountPatient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nik = prefs.getString("nik");
    print("NIK SESSION: $nik");
    List<Patient> _list = [];
    final response = await client.get("$url/get/all/nik/?nik=$nik");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      print(map);
      List<dynamic> data = map["data"];
      if (map["status"] == true) {
        for (Map i in data) {
          _list.add(Patient.fromJson(i));
          // print("ISI $i");
        }
      }
      return _list.length;
    } else {
      return null;
    }
  }
}
