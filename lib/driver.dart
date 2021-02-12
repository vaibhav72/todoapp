import 'package:boocmarq_assignment/home.dart';
import 'package:boocmarq_assignment/newTaskPage.dart';
import 'package:boocmarq_assignment/profile.dart';
import 'package:flutter/material.dart';

class Driver extends StatefulWidget {
  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  int selectedindex = 0;
  List<Widget> items = <Widget>[Home(), Profile(), NewTask()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets, color: Color(0xFF6488E4)),
              title: Text("Home", style: TextStyle(color: Color(0xFF6488E4)))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Color(0xFF6488E4)),
              title: Text(
                "Profile",
                style: TextStyle(color: Color(0xFF6488E4)),
              ))
        ],
        onTap: (value) => setState(() {
          selectedindex = value;
        }),
      ),
      body: items[selectedindex],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6488E4),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewTask()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
