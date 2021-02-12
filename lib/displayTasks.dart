import 'dart:convert';

import 'package:boocmarq_assignment/models/task.model.dart';
import 'package:boocmarq_assignment/newTaskPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ViewTasks extends StatefulWidget {
  Task task;
  ViewTasks({this.task});
  @override
  _ViewTasksState createState() => _ViewTasksState();
}

class _ViewTasksState extends State<ViewTasks> {
  var icons = {
    "Environment": Icon(Icons.nature, color: Colors.green),
    "Electricity": Icon(Icons.flash_on, color: Colors.orange[300]),
    "Pets": Icon(Icons.pets, color: Colors.blueAccent),
    "Person": Icon(Icons.person, color: Colors.blue),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Task",
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: icons[widget.task.category].color,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  DateFormat.E().format(widget.task.date) +
                                      "," +
                                      widget.task.date.day.toString() +
                                      " " +
                                      DateFormat.MMM().format(widget.task.date),
                                  style: TextStyle(fontSize: 35),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: icons[widget.task.category],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.task.title,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              widget.task.description,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Card(
                            color: icons[widget.task.category].color,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "From",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.task.startTime,
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        backgroundColor: icons[widget.task.category].color,
                      ),
                      Column(
                        children: <Widget>[
                          Card(
                            color: icons[widget.task.category].color,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("To",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.task.endTime,
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
