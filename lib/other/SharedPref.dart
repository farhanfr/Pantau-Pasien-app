import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  addDoubleToSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  removeValues(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove(key);
    //Remove bool
    prefs.remove(key);
    //Remove int
    prefs.remove(key);
    //Remove double
    prefs.remove(key);
  }

  checkValues(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool checkValue = prefs.containsKey(key);
    print(checkValue);
  }
}