import 'dart:convert';

import 'package:boocmarq_assignment/displayTasks.dart';
import 'package:boocmarq_assignment/models/task.model.dart';
import 'package:boocmarq_assignment/newTaskPage.dart';
import 'package:boocmarq_assignment/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var icons = {
    "Environment": Icon(Icons.nature, color: Colors.green),
    "Electricity": Icon(Icons.flash_on, color: Colors.orange[300]),
    "Pets": Icon(Icons.pets, color: Colors.blueAccent),
    "Person": Icon(Icons.person, color: Colors.blue),
  };
  List<Task> taskList = [];
  List<Task> newList = [];
  getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email");
    print(email);
    print("here");
    String url =
        "https://api.airtable.com/v0/app8U8XEOBD1xcUSm/Table%201?maxRecords=50&view=Grid%20view";
    Map<String, String> header = {
      "Authorization": "Bearer keyXhXanKoSLRFF2r",
      "Content-Type": "application/json"
    };
    http.Response res = await http.get(url, headers: header);
    Map<String, dynamic> result = json.decode(res.body);
    for (var i in result["records"]) {
      if (email == i["fields"]["email"] &&
          DateTime.parse(i["fields"]["date"]).isAfter(DateTime.now()))
        newList.add(Task(
            description: i["fields"]["description"],
            category: i["fields"]["category"],
            title: i["fields"]["title"],
            endTime: i["fields"]["endtime"],
            date: DateTime.parse(i["fields"]["date"]),
            startTime: i["fields"]["starttime"]));
    }
    setState(() {
      taskList = newList;
    });
  }

  @override
  void initState() {
    if (newList.length == 0) getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Your Tasks",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: taskList.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(taskList[index].title),
                            subtitle: Text(taskList[index].description),
                            leading: icons[taskList[index].category],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewTasks(
                                            task: taskList[index],
                                          )));
                            },
                          ),
                        );
                      })
                  : Center(
                      child: Container(
                        height: 100,
                        width: 300,
                        child: Scaffold(
                          body: Center(
                              child: Text(
                            "No Tasks right now",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 30),
                          )),
                        ),
                      ),
                    )),
        ],
      )),
    );
  }
}
