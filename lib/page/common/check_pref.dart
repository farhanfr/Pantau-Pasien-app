import 'package:get/get.dart';
import 'package:pantau_pasien/page/bottom_navigation/bottom_navigation_main.dart';
import 'package:pantau_pasien/page/common/login.dart';
import 'package:pantau_pasien/page/common/on_boarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPref { 

  checkPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isOnBoarding = (prefs.getInt("isOnBoarding"));
    if (isOnBoarding == null) {
      Get.off(OnBoardingPage());
    } else {
      String nik = (prefs.getString("nik"));
      if (nik == null) {
        Get.off(LoginPage());
      } else {
        Get.off(BottomNavigationMain());
      }
    }
  }
}
