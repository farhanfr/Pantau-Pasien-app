import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/page/dashboard/all_announce_condition_patient.dart';
import 'package:pantau_pasien/page/dashboard/announce_condition_patient.dart';
import 'package:pantau_pasien/page/dashboard/card_monitoring_patient.dart';
import 'package:pantau_pasien/page/dashboard/header_dashboard.dart';

class MainDashboardPage extends StatefulWidget {
  @override
  _MainDashboardPageState createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderDashboard(),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //       vertical: 60.0, horizontal: 25.0),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: Text("Dashboard",
          //         style: TextStyle(color: Colors.white, fontSize: 24.0)),
          //   ),
          // ),
          CardMonitoringPatient(),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 20.0, right: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.to(AllAnnounceConditionPatient());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Pemberitahuan",
                        style: TextStyle(color: primaryColor, fontSize: 20.0)),
                    Icon(
                      Icons.arrow_forward,
                      size: 25.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          AnnounceConditionPatient()
        ],
      ),
    );
  }
}
