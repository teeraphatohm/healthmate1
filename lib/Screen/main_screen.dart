import 'package:flutter/material.dart';
import 'package:healthmate/Screen/Page_covid.dart';
import 'package:healthmate/Screen/Page_hospital.dart';
import 'package:healthmate/Screen/Page_home.dart';
import 'package:healthmate/Screen/Page_calaqi.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
