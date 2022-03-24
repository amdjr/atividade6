import 'package:flutter/material.dart'
    show MaterialApp, ThemeData, runApp;
import 'form.dart';

void main() {
  runApp(
    MaterialApp(
      home: FormClass(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    ),
  );
}
