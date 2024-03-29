import 'package:flutter/material.dart';
import 'package:infoss_hrd/scr/commons.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class LeaveAddPage extends StatefulWidget {
  @override
  _LeaveAddpageState createState() => new _LeaveAddpageState();
}

class _LeaveAddpageState extends State<LeaveAddPage> {
  List<String> reason = ["Cuti", "Sakit"];
  String _reason = "Cuti";

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  void pilihReason(String value) {
    setState(() {
      _reason = value;
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
                        "Request Leave",
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 30.0),
                            child: Text(
                              "Alasan",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          DropdownButton(
                            value: _reason,
                            items: reason.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              pilihReason(value);
                            },
                          ),
                        ],
                      ),
                      Container(height: 20),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintText: 'Note',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
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
                      "Request",
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
