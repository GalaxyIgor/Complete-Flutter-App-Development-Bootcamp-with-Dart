import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900],
          titleTextStyle: const TextStyle(color: Colors.white),
          elevation: 5.0,
          shadowColor: Colors.black, 
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('I Am Rich'),
        ),

        body: Center(
          child: Image(
            image: const NetworkImage(  "https://www.w3schools.com/w3css/img_lights.jpg"          ),
          ),
        )
      ),
    );
  }
}
