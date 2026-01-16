import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100.0,
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                color: Colors.red,
                child: Text("Container 1"),
              ),
              SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                    child: Text("Container 2"),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                    child: Text("Container 2"),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                width: 100.0,
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                color: Colors.blue,
                child: Text("Container 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}