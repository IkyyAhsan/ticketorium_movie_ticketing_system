import 'package:flutter/material.dart';
import 'package:ticketorium_app_project/presentation/misc/constant.dart';

Widget movieScreen() => Container(
  width: 250,
  height: 50,
  margin: const EdgeInsets.only(top: 24, bottom: 10),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [saffron.withOpacity(0.33), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    ),
  ),
  child: Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 3,
      color: saffron,
    ),
  ),
);