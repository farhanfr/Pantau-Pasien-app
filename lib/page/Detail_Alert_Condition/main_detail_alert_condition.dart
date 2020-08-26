import 'package:flutter/material.dart';
import 'package:pantau_pasien/page/Detail_Alert_Condition/content_detail_alert_condition.dart';
import 'package:pantau_pasien/page/Detail_Alert_Condition/header_detail_alert_condition.dart';

class MainDetailAlertCondition extends StatelessWidget {
  final String namePatient,datePost,titlePost,descPost,nameNurse;
  MainDetailAlertCondition({this.namePatient, this.datePost, this.titlePost, this.descPost, this.nameNurse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderDetailAlertCondition(),
          ContentDetailAlertCondition(namePatient: namePatient,datePost: datePost,titlePost: titlePost,descPost: descPost,nameNurse: nameNurse,)
        ],
      ),
    )
    );
    
  }
}