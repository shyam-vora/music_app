import 'package:flutter/material.dart';
import 'package:sopify/screen/app.dart';
import 'package:sopify/screen/login.dart';

void main() {
  runApp(const MaterialApp(
      title: 'spotify clone',
      debugShowCheckedModeBanner: false,
      home: MyLogin()));
}