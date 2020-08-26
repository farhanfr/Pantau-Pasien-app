import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/page/bottom_navigation/bottom_navigation_main.dart';
import 'package:pantau_pasien/page/common/register.dart';
import 'package:pantau_pasien/service/login_user_services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  LoginUserServices loginUserServices;
  TextEditingController nikInp = new TextEditingController();
  TextEditingController passwordInp = new TextEditingController();

  void toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    loginUserServices = LoginUserServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/bgauth.png"), fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
                child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: TextFormField(
                        controller: nikInp,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          // errorBorder: InputBorder.none,
                          hintText: 'NIK',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    Card(
                      child: TextFormField(
                        controller: passwordInp,
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 28.0),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 60,
                      child: RaisedButton(
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (nikInp.text.isEmpty &&
                                passwordInp.text.isEmpty) {
                              toast("nik dan password masih kosong");
                            } else if (nikInp.text.isEmpty) {
                              toast("nik masih kosong");
                            } else if (passwordInp.text.isEmpty) {
                              toast("password masih kosong");
                            } else {
                              loginUserServices
                                  .loginUser(nikInp.text, passwordInp.text)
                                  .then((result) {
                                if (result == 'success') {
                                  print("Berhasil login");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (e) =>
                                              BottomNavigationMain()));
                                  // _scaffoldState.currentState.showSnackBar(SnackBar(
                                  //   content: Text("Berhasil Registerasi"),
                                  // ));
                                } else {
                                  toast("Nik atau password salah");
                                }
                              });
                            }
                          }),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "Not have an account",
                      style: TextStyle(color: secondaryColor),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 60,
                      child: RaisedButton(
                          elevation: 0.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: primaryColor)),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: primaryColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => RegisterPage()));
                          }),
                    ),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
