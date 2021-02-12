// import 'package:flutter/material.dart';

// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   var val = '0';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(
//           Icons.list,
//           color: Colors.black,
//         ),
//         actions: <Widget>[
//           Icon(
//             Icons.search,
//             color: Colors.black,
//           )
//         ],
//         backgroundColor: Color(0xFFF9BE7C),
//         elevation: 0,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: ListView(
//           shrinkWrap: true,
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40.0),
//                       bottomRight: Radius.circular(40.0)),
//                   color: Color(0xFFF9BE7C)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   title: Row(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 20, 8.0, 20),
//                         child: Container(
//                           height: 100.0,
//                           width: 100.0,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: AssetImage('lib/user.jpg'),
//                                 fit: BoxFit.fill),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Container(
//                               child: Text(
//                                 "Vaibhav",
//                                 style: TextStyle(
//                                     fontSize: 30, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Container(
//                               child: Text(
//                                 "Developer",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.black.withOpacity(.5)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "My tasks",
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           child: Icon(
//                             Icons.calendar_today,
//                             color: Colors.white,
//                           ),
//                           backgroundColor: Color(0xFF309397),
//                         ),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: <Widget>[
//                       ListTile(
//                         isThreeLine: true,
//                         title: Text(
//                           'To Do',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w600),
//                         ),
//                         subtitle: Text(
//                           '5 started . 1 done',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         leading: CircleAvatar(
//                             backgroundColor: Color(0xFFE46472),
//                             child: Icon(
//                               Icons.query_builder,
//                               color: Colors.white,
//                             )),
//                       ),
//                       ListTile(
//                         isThreeLine: true,
//                         title: Text(
//                           'In Progress',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w600),
//                         ),
//                         subtitle: Text(
//                           '5 started . 1 done',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         leading: CircleAvatar(
//                             backgroundColor: Color(0xFFF9BE76),
//                             child: Icon(
//                               Icons.donut_large,
//                               color: Colors.white,
//                             )),
//                       ),
//                       ListTile(
//                         isThreeLine: true,
//                         title: Text(
//                           'Done',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w600),
//                         ),
//                         subtitle: Text(
//                           '5 started . 1 done',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         leading: CircleAvatar(
//                           child: Icon(
//                             Icons.fast_forward,
//                             color: Colors.white,
//                           ),
//                           backgroundColor: Color(0xFF6488E4),
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Active Tasks",
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: GridView.count(
//                 controller: ScrollController(),
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                         color: Color(0xFFE46472),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     '25%',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   CircularProgressIndicator(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.2),
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                     value: .25,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Medical App',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white),
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                         color: Color(0xFF6488E4),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     '85%',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   CircularProgressIndicator(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.2),
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                     value: .85,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Sports App',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white),
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                         color: Color(0xFF309397),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     '50%',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   CircularProgressIndicator(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.2),
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                     value: .5,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Banking App',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white),
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                         color: Color(0xFFF9BE76),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     '75%',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   CircularProgressIndicator(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.2),
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                     value: .75,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Rent App',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white),
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                         color: Color(0xFFE46472),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     '90%',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   CircularProgressIndicator(
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.2),
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                     value: .9,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Gaming Platform App',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white),
//                               ),
//                             )
//                           ],
//                         )),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:http/http.dart' as http;
import 'models/task.model.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int completedTask = 0;
  int incompleteTask = 0;
  String email = "";
  String name = "";
  getData() async {
    final prefs = await SharedPreferences.getInstance();
    var v = prefs.getString("email");
    var j = prefs.getString("name");
    setState(() {
      email = v;
      name = j;
    });
  }

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
      if (email == i["fields"]["email"])
        newList.add(Task(
            description: i["fields"]["description"],
            category: i["fields"]["category"],
            title: i["fields"]["title"],
            endTime: i["fields"]["endtime"],
            date: DateTime.parse(i["fields"]["date"]),
            startTime: i["fields"]["starttime"]));
    }
    var a = 0, b = 0;
    for (var item in newList) {
      if (item.date.isBefore(DateTime.now()))
        a += 1;
      else
        b += 1;
    }

    setState(() {
      completedTask = a;
      incompleteTask = b;
      taskList = newList;
    });
  }

  @override
  void initState() {
    getData();
    if (newList.length == 0) getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 10, 80, 2),
            child: SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                axisLineStyle: AxisLineStyle(
                  thickness: 1,
                  color: Colors.white,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
                        stops: <double>[0.25, 0.75]),
                    color: Colors.blue[100],
                    value: (completedTask / taskList.length) * 100,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0.5,
                      angle: 90,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            completedTask.toString(),
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            '/' + taskList.length.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ))
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Good",
              style: TextStyle(fontSize: 30),
            )),
          ),
          Center(child: Text("Your Daily Rate")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        taskList.length.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Created Task"),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.orangeAccent[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        completedTask.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Completed Task"),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Icon(
                          Icons.line_weight,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.redAccent[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        incompleteTask.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Incompleted Task"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
                Text(email,
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Full Name",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
                Text(name,
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
