import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/bloc/tabunganBloc.dart';
import 'package:skripsitabungan/src/pref/preference.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var nama = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
      children: <Widget>[
        SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/login2.jpg"))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextField(
                      controller: nama,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3.0,
                        )),
                        hintText: "Masukkan Nama",
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextField(
                      controller: password,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3.0,
                        )),
                        hintText: "Masukkan Password",
                        hintStyle: TextStyle(color: Colors.blue),
                      ),
                      style: TextStyle(color: Colors.black),
                      autofocus: false,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            tabunganBloc.login(nama.text, password.text);
                            tabunganBloc.getLogin.listen((value) {
                              setNama(value.data[0].nama);
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil('/controllPage', (Route<dynamic> route) => false);
                            });
                          },
                          child: Container(
                            width: 90,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ]),
        )
      ],
    ));
  }
}
