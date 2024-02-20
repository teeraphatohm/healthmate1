import 'package:flutter/material.dart';
import 'package:healthmate/Screen/Page_calaqi.dart';
import 'package:healthmate/Screen/Page_covid.dart';
import 'package:healthmate/Screen/Page_hospital.dart';
import 'package:healthmate/Screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.mainscreen;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.mainscreen) {
      container = mainscreen();
    } else if (currentPage == DrawerSections.Page_hospital) {
      container = hospital();
    } else if (currentPage == DrawerSections.Page_covid) {
      container = covid();
    } else if (currentPage == DrawerSections.Page_calaqi) {
      container = calaqi();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text("Health Mate"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
            UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.lightBlueAccent,
              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.NTGuErH23W1cjfWw-dgFcgHaE7?rs=1&pid=ImgDetMain'),
            ),
            accountName: Text('Teeraphat Yeesai'),
            accountEmail: Text('teeraphat.y@ku.th'),

          ),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "หน้าหลัก", Icons.home,
              currentPage == DrawerSections.mainscreen ? true : false),
          menuItem(2, "โรงพยาบาล", Icons.local_hospital,
              currentPage == DrawerSections.Page_hospital ? true : false),
          menuItem(3, "โควิด19", Icons.coronavirus,
              currentPage == DrawerSections.Page_covid ? true : false),
          menuItem(4, "คำนวณ", Icons.calculate,
              currentPage == DrawerSections.Page_calaqi ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.mainscreen;
            } else if (id == 2) {
              currentPage = DrawerSections.Page_hospital;
            } else if (id == 3) {
              currentPage = DrawerSections.Page_covid;
            } else if (id == 4) {
              currentPage = DrawerSections.Page_calaqi;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  mainscreen,
  Page_hospital,
  Page_covid,
  Page_calaqi,
}