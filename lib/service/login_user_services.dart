import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pantau_pasien/model/PatientFamily.dart';
import 'package:pantau_pasien/other/SharedPref.dart';
import 'package:pantau_pasien/page/bottom_navigation/bottom_navigation_main.dart';

class LoginUserServices{
  final String url = "http://192.168.1.8:8000/api/v1/patientfamily";
  Client client = Client();

  Future<String> loginUser(String nik,String password) async{
    final response = await client.post("$url/login",
    body: {
      'nik':nik,
      'password':password
      }
    );
    if(response.statusCode == 200){
      Map<String,dynamic> map = jsonDecode(response.body);
      print(response.body);
      if(map["status"] == true){
        PatientFamily patientFamily = new PatientFamily.fromJson(map["data"]);
        SharedPref().addStringToSF("nik", patientFamily.nik);
        Get.to(BottomNavigationMain());
        return "success";  
      }else{
        return "failed";
      }
    }
    else{
      print(response.body);
      return "failed";
    }
  }
}