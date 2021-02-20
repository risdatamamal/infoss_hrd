import 'package:flutter/material.dart';

class IntroModel {
  Image image;
  String title;
  String description;
  Widget extraWidget;

  IntroModel({this.image, this.title, this.description, this.extraWidget}) {
    if (extraWidget == null) {
      extraWidget = new Container();
    }
  }
}
