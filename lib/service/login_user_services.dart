import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/model/PatientFamily.dart';
import 'package:pantau_pasien/other/SharedPref.dart';
import 'package:pantau_pasien/page/bottom_navigation/bottom_navigation_main.dart';

class LoginUserServices{
  final String url = "http://192.168.1.8:8000/api/v1/patientfamily";
  Client client = Client();

  void toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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
        toast("Login Berhasil");
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