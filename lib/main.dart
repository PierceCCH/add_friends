import 'package:flutter/material.dart';
import 'home.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
  }
));