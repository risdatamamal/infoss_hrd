import 'package:flutter/material.dart';

class InboxDetail extends StatelessWidget {
  final int index;

  InboxDetail(this.index);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text('The details page #$index'),
    );
  }
}
