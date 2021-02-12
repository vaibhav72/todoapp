import 'package:boocmarq_assignment/driver.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String email;
  bool logged;
  String name = "";

  getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    var v = prefs.getString("email");
    var j = prefs.getBool("logged");
    setState(() {
      email = v;
      logged = j;
    });
  }

  @override
  void initState() {
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return logged != null
        ? Driver()
        : Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 150, 80, 80),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "TODo APp",
                        style: TextStyle(fontSize: 40),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Email"),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Full Name"),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString("email", email);
                          prefs.setString("name", name);
                          prefs.setBool("logged", true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Driver()));
                        },
                        child: Text("Save"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
