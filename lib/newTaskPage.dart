import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String selected_value_Start = 'AM';
  String selected_value_End = 'AM';

  String category = "";
  DateTime selectedDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
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
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintText: '4:00',
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
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
                              child: TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    hintText: '8:00',
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ),
                            ),
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
                          color: category == "SPORT APP"
                              ? Color(0xffe46472)
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = 'SPORT APP';
                            });
                          },
                          child: Text(
                            "SPORT APP",
                            style: TextStyle(
                              color: category == "SPORT APP"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "MEDICAL APP"
                              ? Color(0xff6488e4)
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "MEDICAL APP";
                            });
                          },
                          child: Text(
                            "MEDICAL APP",
                            style: TextStyle(
                              color: category == "MEDICAL APP"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "RENT APP"
                              ? Color(0xff309397)
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "RENT APP";
                            });
                          },
                          child: Text(
                            "RENT APP",
                            style: TextStyle(
                              color: category == "RENT APP"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "BANKING APP"
                              ? Color(0xff0d253f)
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "BANKING APP";
                            });
                          },
                          child: Text(
                            "BANKING APP",
                            style: TextStyle(
                              color: category == "BANKING APP"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: category == "GAMING PLATFORM APP"
                              ? Color(0xfff9be7c)
                              : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              category = "GAMING PLATFORM APP";
                            });
                          },
                          child: Text(
                            "GAMING PLATFORM APP",
                            style: TextStyle(
                              color: category == "GAMING PLATFORM APP"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
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
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF6488E4),
          onPressed: () {},
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Create Task"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
