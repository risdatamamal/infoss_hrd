import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../commons.dart';

class HomePage extends StatefulWidget {
  final VoidCallback signOut;

  HomePage(this.signOut);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String company = "", name = "", position = "";

  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      company = sharedPreferences.get("company");
      name = sharedPreferences.get("name");
      position = sharedPreferences.get("position");
    });
  }

  var loading = false;

  // Content isi untuk mengambil data json disini

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: white,
          appBar: AppBar(title: Image.asset("assets/appbar/Header.png")),
        ));
  }
}
