import 'dart:async';

import 'package:covid_tracker/countries_stats_screen.dart';
import 'package:covid_tracker/world_stats_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WorldStates())) );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Covid - 19 \n Tracker' , textAlign: TextAlign.center , style: TextStyle(color: Colors.white , fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
