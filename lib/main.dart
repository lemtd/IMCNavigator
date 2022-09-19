import 'package:flutter/material.dart';

import 'ui/IMCCalculator.dart';

void main() {
  runApp(MaterialApp(
      title: "IMC Calculator",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const IMCCalculator()));
}