import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infoss_hrd/scr/commons.dart';
import 'package:infoss_hrd/scr/ui/screen/sign_in.dart';
import 'package:infoss_hrd/scr/ui/widgets/customappbar.dart';
import 'package:infoss_hrd/scr/ui/widgets/responsive_ui.dart';
import 'package:infoss_hrd/scr/ui/widgets/textformfield.dart';
import 'package:infoss_hrd/scr/utils/constans_util.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool validate = false;
  bool isSuccsess;

  TextEditingController etEmailId = new TextEditingController();

  var loading = false;

  Future<Null> _forgotpasswordAccount() async {
    setState(() {
      loading = true;
    });

    final response = await http.post(
        ConstantsUtil().PUBLIC_API_URL + "forgotpassword.php",
        body: {'username': etEmailId.text});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        Navigator.of(context).push(new CupertinoPageRoute(
            builder: (BuildContext context) => new SignInPage()));
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(height: _height / 35),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: _height / 20.0),
          height: _height / 5.5,
          width: _width,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              print('Adding Photo');
            },
            child: Image.asset('assets/gambar/Logo.png'),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 60),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      textEditingController: etEmailId,
      hint: "Email",
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.blue[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          )
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        _forgotpasswordAccount();
        print("Routing to your Email account");
      },
      textColor: white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 1.75 : _width / 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('Forgot Password',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  @override
  void dispose() {
    etEmailId.dispose();
    super.dispose();
  }
}
