import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pantau_pasien/const/color.dart';

class RegisterUserServices{
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

  Future<String> registerUser(String nik,String nama,String alamat,String password,String hp) async{
    final response = await client.post("$url/create",
    body: {
      'nik':nik,
      'name':nama,
      'address':alamat,
      'password':password,
      'number_phone':hp
      }
    );
    if(response.statusCode == 200){
      Map<String,dynamic> map = jsonDecode(response.body);
      print(response.body);
      if(map["status"] == true){
        return "success";  
      }else{
        toast(map["message"]);
        return "failed";
      }
    }
    else{
      print(response.body);
      return "failed";
    }
  }


}