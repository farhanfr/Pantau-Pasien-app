import 'package:flutter/material.dart';
import 'package:pantau_pasien/other/SharedPref.dart';
import 'package:pantau_pasien/page/common/login.dart';

class ProfileSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      children: <Widget>[
        ListTile(
          title: Text("Logout",style: TextStyle(color: Colors.red),),
          onTap: (){
            SharedPref().removeValues("nik");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (e) => LoginPage()));
          },
        ),
      ],
    );
  }
}
