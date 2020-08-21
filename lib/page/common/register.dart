import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/service/register_user_services.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

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

  @override
  void initState() {
    super.initState();
    registerUserServices = RegisterUserServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/img/bgauth.png"),fit: BoxFit.cover)
        ),
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
                            registerUserServices
                                .registerUser(
                                   nikInp.text,
                                    namaInp.text,
                                    alamatInp.text,
                                    passwordInp.text,
                                    hpInp.text)
                                .then((result) {
                              if (result == 'success') {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Berhasil Registerasi"),
                                ));
                                nikInp.clear();namaInp.clear();alamatInp.clear();passwordInp.clear();hpInp.clear();
                              } else {
                                _scaffoldState.currentState.showSnackBar(SnackBar(
                                  content: Text("Maaf gagal registerasi"),
                                ));
                              }
                            });
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
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
