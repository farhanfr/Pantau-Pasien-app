import 'dart:convert';

import 'package:http/http.dart';
import 'package:pantau_pasien/model/alert_condition/AlertConditionPatient.dart';
import 'package:pantau_pasien/model/alert_condition/AlertConditionPatientDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertConditionPatientServices {
  final String url = "http://192.168.1.13:8000/api/v1/alertcondition";
  Client client = Client();

  Future<List<AlertConditionPatient>> getAlertCondition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nik = prefs.getString("nik");

    List<AlertConditionPatient> _list = [];
    final response = await client.get("$url/get/all/nik/?nik=$nik");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      print(map);
      if (map["status"] == true) {
        List<dynamic> data = map["data"];
        for (Map i in data) {
          _list.add(AlertConditionPatient.fromJson(i));
          // print("ISI $i");
        }
      }
      return _list;
    } else {
      return null;
    }
  }

  Future<List<AlertConditionPatientDetail>> getAlertConditionByPatient(
      id) async {
    List<AlertConditionPatientDetail> _list = [];
    final response = await client.get("$url/get/all/id/?id=$id");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      print(map);
      if (map["status"] == true) {
        List<dynamic> data = map["data"];
        for (Map i in data) {
          _list.add(AlertConditionPatientDetail.fromJson(i));
        }
      }

      return _list;
    } else {
      return null;
    }
  }
}
