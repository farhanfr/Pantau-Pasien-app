import 'dart:convert';

import 'package:http/http.dart';

class RegisterUserServices{
  final String url = "http://192.168.1.13:8000/api/v1/patientfamily";
  Client client = Client();

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
        return "failed";
      }
    }
    else{
      print(response.body);
      return "failed";
    }
  }


}