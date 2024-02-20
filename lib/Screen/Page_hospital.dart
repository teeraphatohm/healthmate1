import 'package:flutter/material.dart';
import 'package:healthmate/Screen/Page_covid.dart';
import 'package:healthmate/Screen/Page_home.dart';
import 'package:healthmate/Screen/main_screen.dart';

class hospital extends StatefulWidget {
  const hospital({super.key});

  @override
  State<hospital> createState() => _hospitalState();
}

class _hospitalState extends State<hospital> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Hospital Page"),
      ),
    );
  }}
