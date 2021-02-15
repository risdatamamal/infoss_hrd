import 'package:flutter/material.dart';

import 'responsive_ui.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;

  CustomTextField(
      {this.hint,
      this.textEditingController,
      this.keyboardType,
      this.obscureText = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blueAccent[200],
        decoration: InputDecoration(
            prefix: Icon(icon, color: Colors.blueAccent[200], size: 20),
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
