import 'dart:convert';

import 'package:http/http.dart';
import 'package:pantau_pasien/model/PatientFamily.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientFamilyServices {
  final String url = "http://192.168.1.8:8000/api/v1/patientfamily";
  Client client = Client();

  Future<List<PatientFamily>> getPatientFamilyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nik = prefs.getString("nik");
    List<PatientFamily> _list = [];
    final response = await client.get("$url/get/all/nik/?nik=$nik");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      print(map);
      if (map["status"] == true) {
        Map data = map["data"];
        data.entries.forEach((e) {
          _list.add(PatientFamily.fromJson(map["data"]));
        });
        // for (Map i in data) {
        //   _list.add(PatientFamily.fromJson(i));
        // }
      }
      return _list;
    } else {
      return null;
    }
  }
}
