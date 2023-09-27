import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page_content.dart'; // Importing the RegisterPage

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0, // Remove shadow
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'L.earn',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                child: Text('             Login             '),
                onPressed: () {
                  // Navigate to login or another relevant page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                  onPrimary: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('          Register           '),
                onPressed: () {
                  // Navigate to the registration page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                  onPrimary: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
