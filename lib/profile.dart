import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var val = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list,
          color: Colors.black,
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
        backgroundColor: Color(0xFFF9BE7C),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
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
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 8.0, 20),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('lib/user.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Vaibhav",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Developer",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(.5)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "My tasks",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xFF309397),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        isThreeLine: true,
                        title: Text(
                          'To Do',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '5 started . 1 done',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                            backgroundColor: Color(0xFFE46472),
                            child: Icon(
                              Icons.query_builder,
                              color: Colors.white,
                            )),
                      ),
                      ListTile(
                        isThreeLine: true,
                        title: Text(
                          'In Progress',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '5 started . 1 done',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                            backgroundColor: Color(0xFFF9BE76),
                            child: Icon(
                              Icons.donut_large,
                              color: Colors.white,
                            )),
                      ),
                      ListTile(
                        isThreeLine: true,
                        title: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '5 started . 1 done',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xFF6488E4),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Active Tasks",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: GridView.count(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Color(0xFFE46472),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Text(
                                    '25%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    value: .25,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Medical App',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Color(0xFF6488E4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Text(
                                    '85%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    value: .85,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sports App',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Color(0xFF309397),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Text(
                                    '50%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    value: .5,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Banking App',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Color(0xFFF9BE76),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Text(
                                    '75%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    value: .75,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Rent App',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: Color(0xFFE46472),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Text(
                                    '90%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Colors.white.withOpacity(.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    value: .9,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Gaming Platform App',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
