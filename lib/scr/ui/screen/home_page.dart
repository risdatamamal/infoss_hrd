import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infoss_hrd/scr/commons.dart';
import 'package:infoss_hrd/scr/models/model_all_inbox.dart';
import 'package:infoss_hrd/scr/ui/screen/education_page.dart';
import 'package:infoss_hrd/scr/ui/screen/family_information_page.dart';
import 'package:infoss_hrd/scr/ui/screen/jobexp_page.dart';
import 'package:infoss_hrd/scr/ui/screen/leave_page.dart';
import 'package:infoss_hrd/scr/ui/screen/overtime_page.dart';
import 'package:infoss_hrd/scr/ui/screen/skill_page.dart';
import 'package:infoss_hrd/scr/ui/screen/training_page.dart';
import 'package:infoss_hrd/scr/utils/constans_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int selectedIndex;
  final Function(int index) onTap;
  int selectedPage = 0;
  _HomePageState({this.selectedIndex = 0, this.onTap});

  PageController pageController = PageController(initialPage: 0);

  // Widget profilePicture;
  String company = "";
  String nama = "";
  String position = "";

  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // profilePicture = sharedPreferences.get("photo");
      company = sharedPreferences.get("company");
      nama = sharedPreferences.get("nama");
      position = sharedPreferences.get("posisi");
    });
  }

  var loading = false;

  // Content isi untuk mengambil data json disini

  List<ModelAllDataInbox> _list_inbox = [];

  Future<Null> _fetchDataAllInbox() async {
    setState(() {
      loading = true;
    });

    final response =
        await http.get(ConstantsUtil().PUBLIC_API_URL + "get_data_inbox.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list_inbox.add(ModelAllDataInbox.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            backgroundColor: white,
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

          // Body sesuai Index
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

              // Page in here
              SafeArea(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  children: [
                    // Home
                    ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 150,
                              child: Card(
                                color: Colors.transparent,
                                shadowColor: Colors.transparent,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 33,
                                      child: Image.network(
                                        'https://picsum.photos/250?image=9',
                                      ),
                                    ),
                                    Expanded(
                                      flex: 66,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 40,
                                            child: Center(
                                                child: Text(
                                              'PT. Solusi Sentral Data',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                          ),
                                          Expanded(
                                              flex: 25,
                                              child:
                                                  Text('Nama: Emon Sulaksana')),
                                          Expanded(
                                              flex: 25,
                                              child: Text(
                                                  'Position: Staff Karyawan')),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 115,
                              child: Card(
                                shadowColor: Colors.transparent,
                                color: Colors.transparent,
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 30.0),
                                        child: Card(
                                          color: Color(0xff6BC8D8),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 30.0,
                                                top: 20.0,
                                                right: 30.0),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(Icons.assignment_outlined,
                                                    size: 40.0),
                                                Text("Leave",
                                                    style: TextStyle(
                                                        fontSize: 16.0)),
                                              ],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      onTap: () {
                                        print("Click Leave");
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LeavePage();
                                        }));
                                      },
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 60.0),
                                        child: Card(
                                          color: Color(0xff6BC8D8),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 30.0,
                                                top: 20.0,
                                                right: 30.0),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(Icons.date_range,
                                                    size: 40.0),
                                                Text("Overtime",
                                                    style: TextStyle(
                                                        fontSize: 16.0)),
                                              ],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                      onTap: () {
                                        print("Click Overtime");
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return OvertimePage();
                                        }));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 115,
                              child: Opacity(
                                opacity: 0.9,
                                child: Card(
                                  shadowColor: Colors.transparent,
                                  color: Color(0xff28B0C7),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          "Announcement",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 120.0),
                                          child: Text(
                                            'View All',
                                            style: TextStyle(color: white),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          print("Click View All");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    color: Color(0xff8DD5E1),
                                    shadowColor: Colors.grey,
                                    child: ListTile(
                                      title: Text('Announcement 1'),
                                      subtitle: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                      trailing: Text('12/05/2020'),
                                    ),
                                  ),
                                  Card(
                                    color: Color(0xff8DD5E1),
                                    shadowColor: Colors.grey,
                                    child: ListTile(
                                      title: Text('Announcement 2'),
                                      subtitle: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                      trailing: Text('12/05/2020'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Announcement
                    ListView(
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: Card(
                            color: Color(0xff28B0C7),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 66,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 40,
                                        child: Center(
                                            child: Text(
                                          'Announcement',
                                          style: TextStyle(fontSize: 24),
                                        )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Card(
                              color: Color(0xff8DD5E1),
                              shadowColor: Colors.grey,
                              child: ListTile(
                                title: Text('Announcement 1'),
                                subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                trailing: Text('12/05/2020'),
                              ),
                            ),
                            Card(
                              color: Color(0xff8DD5E1),
                              shadowColor: Colors.grey,
                              child: ListTile(
                                title: Text('Announcement 2'),
                                subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                trailing: Text('12/05/2020'),
                              ),
                            ),
                            Card(
                              color: Color(0xff8DD5E1),
                              shadowColor: Colors.grey,
                              child: ListTile(
                                title: Text('Announcement 3'),
                                subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                trailing: Text('12/05/2020'),
                              ),
                            ),
                            Card(
                              color: Color(0xff8DD5E1),
                              shadowColor: Colors.grey,
                              child: ListTile(
                                title: Text('Announcement 4'),
                                subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                trailing: Text('12/05/2020'),
                              ),
                            ),
                            Card(
                              color: Color(0xff8DD5E1),
                              shadowColor: Colors.grey,
                              child: ListTile(
                                title: Text('Announcement 5'),
                                subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                trailing: Text('12/05/2020'),
                              ),
                            ),
                            Card(
                              color: Color(0xff8DD5E1),
                              shadowColor: Colors.grey,
                              child: ListTile(
                                title: Text('Announcement 6'),
                                subtitle: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                trailing: Text('12/05/2020'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Inbox
                    Stack(
                      children: <Widget>[
                        ListView(
                          children: <Widget>[
                            Container(
                              height: 100,
                              child: Card(
                                shadowColor: Colors.transparent,
                                color: Colors.transparent,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 66,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 40,
                                            child: Center(
                                                child: Text(
                                              'Inbox',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text('Sekretariat',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                  leading: FlutterLogo(size: 50),
                                ),
                                ListTile(
                                  title: Text('HRD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                  leading: FlutterLogo(size: 50),
                                ),
                                ListTile(
                                  title: Text('Komisaris',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                  leading: FlutterLogo(size: 50),
                                ),
                                ListTile(
                                  title: Text('Advance',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                  leading: FlutterLogo(size: 50),
                                ),
                                ListTile(
                                  title: Text('Wakil Direktur',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien nibh, imperdiet ac est non'),
                                  leading: FlutterLogo(size: 50),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.add),
                              backgroundColor: Color(0xff28B0C7),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Profile
                    ListView(children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            child: Card(
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 33,
                                    child: Image.network(
                                      'https://picsum.photos/250?image=9',
                                    ),
                                  ),
                                  Expanded(
                                    flex: 66,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 40,
                                          child: Center(
                                              child: Text(
                                            'PT. Solusi Sentral Data',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )),
                                        ),
                                        Expanded(
                                            flex: 25,
                                            child:
                                                Text('Nama: Emon Sulaksana')),
                                        Expanded(
                                            flex: 25,
                                            child: Text(
                                                'Position: Staff Karyawan')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("My Profile");
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Text('My Profile',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("Family");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FamilyInformation();
                              }));
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Family',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("Education");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EducationPage();
                              }));
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Education',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("Skill");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SkillPage();
                              }));
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child:
                                  Text('Skill', style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("Job Experience");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return JobExperiencePage();
                              }));
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Job Experience',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("Training");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TrainingPage();
                              }));
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Text('Training',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              print("LogOut Successfull");
                              signOut();
                            },
                            textColor: white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xff28B0C7),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: Text('LogOut',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedPage,
            iconSize: 32,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text("Home"),
                activeIcon: Icon(Icons.home),
                backgroundColor: Color(0xff28B0C7),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.announcement_outlined),
                title: Text("Announcement"),
                activeIcon: Icon(Icons.announcement),
                backgroundColor: Color(0xff28B0C7),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox_outlined),
                title: Text("Inbox"),
                activeIcon: Icon(Icons.inbox),
                backgroundColor: Color(0xff28B0C7),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                title: Text("Profile"),
                activeIcon: Icon(Icons.person),
                backgroundColor: Color(0xff28B0C7),
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
              pageController.jumpToPage(selectedPage);
            },
          ),
        ));
  }
}
