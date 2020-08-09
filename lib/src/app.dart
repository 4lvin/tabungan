import 'package:flutter/material.dart';
import 'package:skripsitabungan/src/ui/home.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        body: Home(),
      ),
      routes: <String,WidgetBuilder>{
      },
    );
  }
}
