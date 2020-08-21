import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';

class HeaderPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150.0,
        color: primaryColor,
        child: SafeArea(child: Padding(
          padding: const EdgeInsets.only(top: 45.0,left: 27.0),
          child: Text("List Pasien",style: TextStyle(color: Colors.white,fontSize: 24.0),),
        )
        ),
    );
  }
}