import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isStop=true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi Stopwatch"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counter.toString(),
                style: (TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10,),
              RaisedButton(
                child: Text("START"),
                color: Colors.pink, 
                onPressed: () {
                  isStop=false;
                  counter=0;
                  Timer.periodic(Duration(seconds: 1 ), (timer){
                    if (isStop) timer.cancel();
                    setState(() {
                      counter++;
                    });
                  });
                },
              ),
              SizedBox(height: 10,),              
              RaisedButton(
                child: Text("STOP"),
                color: Colors.amber, 
                onPressed: () {
                  isStop=true;
                },
              ),
              SizedBox(height: 10,),
              RaisedButton(
                child: Text("TIMER"), 
                color: Colors.blue,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
