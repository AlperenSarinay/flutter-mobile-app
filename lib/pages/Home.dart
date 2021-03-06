import 'package:flutter/material.dart';
import 'package:newapp/pages/profile.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<Home> {
  @override
  void initState() {
    super.initState();
    startTimer();
    checkRememberMe();
  }

  checkRememberMe() async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("isLoggedIn") == true){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    }
  }
  
  startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              )
            )
          ),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 2,
          )
        ]),
      ),
    );
  }
}
