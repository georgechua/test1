import 'package:flutter/material.dart';
import 'dart:math';

import './carCalc.dart';
import './homeCalc.dart';

class CalcLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      )
    );
  }
}