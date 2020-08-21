import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/page/profile/header_profile.dart';
import 'package:pantau_pasien/page/profile/info_profile.dart';
import 'package:pantau_pasien/page/profile/profile_setting.dart';

class MainProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderProfile(),
        InfoProfile(),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 5.0, right: 25.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Pengaturan Profile",
                    style: TextStyle(color: primaryColor, fontSize: 20.0)),
                // Icon(
                //   Icons.arrow_forward,
                //   size: 25.0,
                // )
              ],
            ),
          ),
        ),
        ProfileSetting()
      ],
    );
  }
}
