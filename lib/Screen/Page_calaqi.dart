import 'package:flutter/material.dart';
import 'package:healthmate/Screen/Page_covid.dart';
import 'package:healthmate/Screen/Page_hospital.dart';
import 'package:healthmate/Screen/Page_home.dart';
import 'package:healthmate/Screen/main_screen.dart';

class calaqi extends StatefulWidget {
  const calaqi({super.key});

  @override
  State<calaqi> createState() => _calaqiState();
}

class _calaqiState extends State<calaqi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Calculate AQI Page"),
      ),
    );
  }
}
