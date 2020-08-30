import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:pantau_pasien/model/alert_condition/AlertConditionPatient.dart';
import 'package:pantau_pasien/page/Detail_Alert_Condition/main_detail_alert_condition.dart';
import 'package:pantau_pasien/service/alert_condition_patient_services.dart';

class AnnounceConditionPatient extends StatefulWidget {
  @override
  _AnnounceConditionPatientState createState() =>
      _AnnounceConditionPatientState();
}

class _AnnounceConditionPatientState extends State<AnnounceConditionPatient> {
  AlertConditionPatientServices alertConditionPatientServices;

  @override
  void initState() {
    super.initState();
    alertConditionPatientServices = AlertConditionPatientServices();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: alertConditionPatientServices.getAlertCondition(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<AlertConditionPatient> alertCondition = snapshot.data;
            print("DATANEE : ${snapshot.data}");
            return buildContainerListBuilder(alertCondition);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Container buildContainerListBuilder(List<AlertConditionPatient> alertCondition) {
    return alertCondition.length == 0 ? Container(child: Center(child: Text("Pemberitahuan tidak ada"),)):
    Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: alertCondition.length <= 5 ? alertCondition.length : 5,
          itemBuilder: (BuildContext context, int index) {
            return buildContainerContent(context, index, alertCondition);
          }),
    );
  }

  Container buildContainerContent(BuildContext context, int index,List<AlertConditionPatient> alertCondition) {
    return Container(
      child: GestureDetector(
        onTap: (){
          Get.to(MainDetailAlertCondition(
            id: alertCondition[index].id.toString(),
          ));
        },
        child: Container(
        margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        // height: 260,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: fromCSSColor(alertCondition[index].color),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Icon(
                  Icons.speaker_notes,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(alertCondition[index].title,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),maxLines: 2,),
                    Text(alertCondition[index].patient.name,
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.only(right: 10.0, top: 10.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        alertCondition[index].datepost,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    ),
      )
    );
  }
}
