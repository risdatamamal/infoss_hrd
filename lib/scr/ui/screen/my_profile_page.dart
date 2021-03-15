import 'package:flutter/material.dart';
import 'package:infoss_hrd/scr/commons.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 5.0),
              child: Image.asset(
                "assets/gambar/Logo.png",
                scale: 3.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff28B0C7),
                border: Border.all(
                  color: Color(0xff28B0C7),
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("INFOSS HRD",
                    style: TextStyle(fontSize: 20, color: white)),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: white,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/background/logo-background.png'),
              color: white,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          child: Image(
                              image: AssetImage(
                                  "assets/icon/previous-button.png")),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Text(
                        "My Profile",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 460,
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "NIK",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "317xxxxxxxx",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Emon Sulaksana",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Nickname",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Emon",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Departement",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Kominfo",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Job Title",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Staff Karyawan",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Grade",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Grade",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Level",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Level",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Atasan",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Atasan",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
