import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/page/common/login.dart';
import 'package:pantau_pasien/service/register_user_services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterUserServices registerUserServices;
  TextEditingController nikInp = new TextEditingController();
  TextEditingController namaInp = new TextEditingController();
  TextEditingController alamatInp = new TextEditingController();
  TextEditingController passwordInp = new TextEditingController();
  TextEditingController hpInp = new TextEditingController();

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
    registerUserServices = RegisterUserServices();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
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
                    SizedBox(height: 10.0),
                    Card(
                      child: TextFormField(
                        controller: namaInp,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Nama',
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Card(
                      child: TextFormField(
                        controller: alamatInp,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Alamat',
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 10.0),
                    Card(
                      child: TextFormField(
                        controller: hpInp,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'No.Hp',
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
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (nikInp.text.isEmpty) {
                              toast("Nik masih kosong");
                            } else if (namaInp.text.isEmpty) {
                              toast("Nama masih kosong");
                            } else if (alamatInp.text.isEmpty) {
                              toast("Alamat masih kosong");
                            } else if (passwordInp.text.isEmpty) {
                              toast("Password masih kosong");
                            } else if (hpInp.text.isEmpty) {
                              toast("No hp masih kosong");
                            } else {
                              registerUserServices
                                  .registerUser(
                                      nikInp.text,
                                      namaInp.text,
                                      alamatInp.text,
                                      passwordInp.text,
                                      hpInp.text)
                                  .then((result) {
                                if (result == 'success') {
                                  _scaffoldState.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text("Berhasil Registerasi"),
                                  ));
                                  nikInp.clear();
                                  namaInp.clear();
                                  alamatInp.clear();
                                  passwordInp.clear();
                                  hpInp.clear();
                                } else {
                                  print("gagal daftar");
                                }
                              });
                            }
                          }),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "have an account",
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
                            "LOGIN",
                            style: TextStyle(color: primaryColor),
                          ),
                          onPressed: () {
                            Get.to(LoginPage());
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
