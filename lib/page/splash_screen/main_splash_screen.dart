import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/page/common/check_pref.dart';


class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
     Future.delayed(Duration(seconds: 3), () {
       CheckPref().checkPref();
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pantau Pasien",
              // textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32.0,
                  height: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            if (isLoading)
              SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[200]),
                ),
              )
            else
              Text("1")
          ],
        ),
      ),
    );  
  }
}