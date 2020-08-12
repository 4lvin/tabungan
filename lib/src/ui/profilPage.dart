import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/pref/preference.dart';
class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String nama;
  @override
  void initState() {
    getNama().then((value){
      setState(() {
        nama = value;
        print(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("$nama")),
    );
  }
}
