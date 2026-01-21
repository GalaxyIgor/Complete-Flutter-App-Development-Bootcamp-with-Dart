import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage( 'images/avatar.png'),
                radius: 50.0,
                backgroundColor: Colors.red,
                child: Text("Avatar"),
              ),
              Text(
                'Galaxy',
                style: GoogleFonts.pacifico(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.grey,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),  
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  title: Text(
                    '+123 456 7890',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                )
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  title: Text(
                    'galaxy@email.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0,
                    ),
                  ),
                )
              ),
            ],                                
          ),
        ),
      ),
    );
  }
}
