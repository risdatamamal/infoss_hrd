import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infoss_hrd/scr/commons.dart';
import 'package:infoss_hrd/scr/constant/constants.dart';
import 'package:infoss_hrd/scr/ui/screen/home_page.dart';
import 'package:infoss_hrd/scr/ui/widgets/responsive_ui.dart';
import 'package:infoss_hrd/scr/ui/widgets/textformfield.dart';
import 'package:infoss_hrd/scr/utils/constans_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

enum statusLogin { signIn, notSignIn }

class _SignInScreenState extends State<SignInScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  statusLogin _loginStatus = statusLogin.notSignIn;

  var loading = false;

  Future<Null> _login() async {
    setState(() {
      loading = true;
    });

    final response = await http
        .post(ConstantsUtil().PUBLIC_API_URL + "login.php", body: {
      'username': emailController.text,
      'password': passwordController.text
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);

      int value = data['value'];
      String pesan = data['message'];
      String usernameApi = data['username'];
      String namaApi = data['nama'];

      if (value == 1) {
        setState(() {
          _loginStatus = statusLogin.signIn;
          savePref(value, namaApi, usernameApi);
        });
        print(pesan);
      } else {
        print(pesan);
      }
      print(data);

      setState(() {
        Navigator.of(context).push(new CupertinoPageRoute(
            builder: (BuildContext context) => new HomePage(signOut)));
        loading = false;
      });
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Login Failed')));
    }
  }

  savePref(int value, String nama, String username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("nama", nama);
      sharedPreferences.setString("username", username);
      sharedPreferences.commit();
    });
  }

  var value;
  getPrev() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      value = sharedPreferences.getInt("value");
      _loginStatus = value == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      _login();
    }
  }

  signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", null);
      sharedPreferences.commit();
      _loginStatus = statusLogin.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPrev();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Material(
          child: Container(
            height: _height,
            width: _width,
            padding: EdgeInsets.only(bottom: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  logo(),
                  form(),
                  SizedBox(height: _height / 12),
                  button(),
                  forgetPassTextRow(),
                ],
              ),
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return HomePage(signOut);
        break;
    }
  }

  Widget logo() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: _large ? _height / 30 : (_medium ? _height / 25 : _height / 20)),
      child: Image.asset('assets/gambar/Logo.png',
          height: _height / 2.5, width: _width / 1),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 65.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.person,
      obscureText: false,
      hint: "Username",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: passwordController,
      icon: Icons.lock,
      obscureText: true,
      hint: "Password",
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to your account");
        _login();
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
        child: Text('SIGN IN',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 16 : (_medium ? 14 : 12)),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(FORGOT_PASSWORD);
              print("Routing to Forgot Password screen");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent[200],
                  fontSize: _large ? 16 : (_medium ? 14 : 12)),
            ),
          ),
        ],
      ),
    );
  }
}
