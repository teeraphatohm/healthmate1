import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as cv;

class covid extends StatefulWidget {
  const covid({super.key});

  @override
  State<covid> createState() => _covidState();
}

class _covidState extends State<covid> {
  var users;
  Future<Null> getUser() async{
    var url =
    Uri.https('covid19.ddc.moph.go.th', '/api/Cases/today-cases-by-provinces');

    //https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces

    final rep = await http.get(url);
    if(rep.statusCode == 200){
      var jsonRep = cv.jsonDecode(rep.body);
      //----------------print(jsonRep);
      setState(() {
        users = jsonRep;
      });
    } else {
      print('Connection Error');
    }
  }

  void initState(){
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COVID-19 ประจำสัปดาห์ แยกตามรายจังหวัด', style: TextStyle(fontSize: 18),),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          int new_case = users[index]["new_case"];
          return Card(
            color: new_case >= 5 ? Colors.red : Colors.white,
            child: ListTile(
              onTap: () {},
              title: Text(
                '${users[index]["province"]} ติดเชื่อใหม่วันนี้ ${users[index]["new_case"]}',
                style: TextStyle(color: new_case >= 5 ? Colors.white : Colors.black),
              ),
              subtitle: Text(
                'อัปเดตเมื่อ ${users[index]["update_date"]}',
                style: TextStyle(color: new_case >= 5 ? Colors.white : Colors.black),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: new_case >= 5 ? Colors.white : Colors.black),
            ),
          );
        },
        itemCount: users != null ? users.length : 0,
      ),
    );
  }
}
