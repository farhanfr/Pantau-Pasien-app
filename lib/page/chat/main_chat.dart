import 'package:flutter/material.dart';
import 'package:pantau_pasien/page/chat/header_chat.dart';

class MainChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderChat(),
        SizedBox(height: 50.0,),
        Image.asset("assets/img/underdev.png",width: 300.0,)
      ],
    );
  }
}