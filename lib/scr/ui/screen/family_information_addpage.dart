import 'package:flutter/material.dart';
import 'package:infoss_hrd/scr/commons.dart';

class FamilyInformationAddPage extends StatefulWidget {
  @override
  _FamilyInformationAddpageState createState() =>
      new _FamilyInformationAddpageState();
}

class _FamilyInformationAddpageState extends State<FamilyInformationAddPage> {
  List<String> relationship = [
    "Ayah",
    "Ibu",
    "Saudara Perempuan",
    "Saudara Laki-Laki"
  ];
  String _relationship = "Ayah";

  List<String> gender = ["Laki-Laki", "Perempuan"];
  String _gender = "Laki-Laki";

  List<String> education = ["SD", "SMP", "SMA/SMK", "D3", "S1/D4", "S2", "S3"];
  String _education = "SD";

  void pilihRelationship(String value) {
    setState(() {
      _relationship = value;
    });
  }

  void pilihGender(String value) {
    setState(() {
      _gender = value;
    });
  }

  void pilihEducation(String value) {
    setState(() {
      _education = value;
    });
  }

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
                        "Family Information",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Nama',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      Container(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 30.0),
                            child: Text(
                              "Relationship",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          DropdownButton(
                            value: _relationship,
                            items: relationship.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              pilihRelationship(value);
                            },
                          ),
                        ],
                      ),
                      Container(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 30.0),
                            child: Text(
                              "Gender",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          DropdownButton(
                            value: _gender,
                            items: gender.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              pilihGender(value);
                            },
                          ),
                        ],
                      ),
                      Container(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 30.0),
                            child: Text(
                              "Education",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          DropdownButton(
                            value: _education,
                            items: education.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              pilihEducation(value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                    color: Color(0xff28B0C7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xff28B0C7))),
                    child: Text(
                      "Save",
                      style: TextStyle(color: white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })),
          ),
        ],
      ),
    );
  }
}
