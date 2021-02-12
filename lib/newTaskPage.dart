import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String selected_value_Start = 'AM';
  String selected_value_timeStart = '01:00';

  String selected_value_timeEnd = '02:00';
  String selected_value_End = 'AM';
  String description = "";
  String title = "";
  bool success = false;
  String email = "";

  String category = "";
  DateTime selectedDate = DateTime.now();
  String startTime = "12:00";
  String endTime = "12:00";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) print(picked.toString());
    setState(() {
      selectedDate = picked;
    });
  }

  getCreds() async {
    final prefs = await SharedPreferences.getInstance();
    var v = prefs.getString("email");
    setState(() {
      email = v;
    });
  }

  createTask() async {
    String url =
        "https://api.airtable.com/v0/app8U8XEOBD1xcUSm/Table%201?maxRecords=3&view=Grid%20view";
    Map<String, String> header = {
      "Authorization": "Bearer keyXhXanKoSLRFF2r",
      "Content-Type": "application/json"
    };
    String body = json.encode({
      "records": [
        {
          "fields": {
            "title": title,
            "category": category,
            "starttime": selected_value_timeStart + selected_value_Start,
            "endtime": selected_value_timeEnd + selected_value_End,
            "date": selectedDate.toString(),
            "description": description,
            "email": email
          }
        },
      ]
    });

    http.Response response = await http.post(url, headers: header, body: body);

    Map<String, dynamic> result = json.decode(response.body);
    print(result.toString());
    if (response.statusCode == 200) {
      setState(() {
        success = true;
      });
    }

    if (success)
      return true;
    else
      return false;
  }

  @override
  void initState() {
    getCreds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Color(0xFFF9BE7C),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)),
                  color: Color(0xFFF9BE7C)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Create  new task",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => {
                            setState(() {
                              title = value;
                            })
                          },
                          style: TextStyle(fontSize: 20),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 50, left: 8, right: 8, top: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Date'),
                                FlatButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        DateFormat.E().format(selectedDate) +
                                            "," +
                                            selectedDate.day.toString() +
                                            " " +
                                            DateFormat.MMM()
                                                .format(selectedDate),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ))
                              ],
                            )),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: Icon(Icons.calendar_today),
                                color: Colors.white,
                              ),
                              backgroundColor: Color(0xFF309397),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Start time',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: DropdownButton(
                                icon: Icon(Icons.arrow_downward),
                                elevation: 0,
                                onChanged: (String newValue) {
                                  setState(() {
                                    selected_value_timeStart = newValue;
                                  });
                                },
                                value: selected_value_timeStart,
                                items: [
                                  "01:00",
                                  "01:30",
                                  "02:00",
                                  "02:30",
                                  "03:00",
                                  "03:30",
                                  "04:00",
                                  "04:30",
                                  "05:00",
                                  "05:30",
                                  "06:00",
                                  "06:30",
                                  "07:00",
                                  "07:30",
                                  "08:00",
                                  "08:30",
                                  "09:00",
                                  "09:30",
                                  "10:00",
                                  "10:30",
                                  "11:00",
                                  "11:30",
                                  "12:00",
                                  "12:30"
                                ].map((e) {
                                  return DropdownMenuItem<String>(
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black38),
                                      ),
                                      value: e);
                                }).toList(),
                              ),
                            ),
                            Container(
                                child: DropdownButton(
                              icon: Icon(Icons.arrow_downward),
                              elevation: 0,
                              onChanged: (String newValue) {
                                setState(() {
                                  selected_value_Start = newValue;
                                });
                              },
                              value: selected_value_Start,
                              items: ["AM", "PM"].map((e) {
                                return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black38),
                                    ),
                                    value: e);
                              }).toList(),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'End time',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: 80,
                                child: DropdownButton(
                                  icon: Icon(Icons.arrow_downward),
                                  elevation: 0,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      selected_value_timeEnd = newValue;
                                    });
                                  },
                                  value: selected_value_timeEnd,
                                  items: [
                                    "01:00",
                                    "01:30",
                                    "02:00",
                                    "02:30",
                                    "03:00",
                                    "03:30",
                                    "04:00",
                                    "04:30",
                                    "05:00",
                                    "05:30",
                                    "06:00",
                                    "06:30",
                                    "07:00",
                                    "07:30",
                                    "08:00",
                                    "08:30",
                                    "09:00",
                                    "09:30",
                                    "10:00",
                                    "10:30",
                                    "11:00",
                                    "11:30",
                                    "12:00",
                                    "12:30"
                                  ].map((e) {
                                    return DropdownMenuItem<String>(
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black38),
                                        ),
                                        value: e);
                                  }).toList(),
                                )),
                            Container(
                                child: DropdownButton(
                              icon: Icon(Icons.arrow_downward),
                              elevation: 0,
                              onChanged: (String newValue) {
                                setState(() {
                                  selected_value_End = newValue;
                                });
                              },
                              value: selected_value_End,
                              items: ["AM", "PM"].map((e) {
                                return DropdownMenuItem<String>(
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black38),
                                    ),
                                    value: e);
                              }).toList(),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => {
                  setState(() {
                    description = value;
                  })
                },
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 18),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Category'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "Environment"
                              ? Colors.green
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = 'Environment';
                            });
                          },
                          child: Text(
                            "Environment",
                            style: TextStyle(
                              color: category == "Environment"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "Pets"
                              ? Colors.blueAccent
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "Pets";
                            });
                          },
                          child: Text(
                            "Pets",
                            style: TextStyle(
                              color: category == "Pets"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "Electricity"
                              ? Colors.orange[300]
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "Electricity";
                            });
                          },
                          child: Text(
                            "Electricity",
                            style: TextStyle(
                              color: category == "Electricity"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RaisedButton(
                          color: category == "Person"
                              ? Colors.blue
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "Person";
                            });
                          },
                          child: Text(
                            "Person",
                            style: TextStyle(
                              color: category == "Person"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF6488E4),
          onPressed: () async {
            bool done = await createTask();

            if (done) {
              Fluttertoast.showToast(
                msg: "Created Task Successfully",
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
              );
              Navigator.pop(context);
            }
          },
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Create Task"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
