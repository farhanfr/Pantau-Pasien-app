import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';

class HeaderChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150.0,
        color: primaryColor,
        child: SafeArea(child: Padding(
          padding: const EdgeInsets.only(top: 45.0,left: 20.0),
          child: Text("Fitur dalam Pengembangan",style: TextStyle(color: Colors.white,fontSize: 20.0),),
        )
        ),
    );
  }
}