import 'package:flutter/material.dart';

import '../Pages/login.dart';
import '../adminpanel/admin.dart'; // Import your login page

void main() {
  runApp(SalonApp());
}

class SalonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 219, 216, 216), // Set the background color to transparent

      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'images/abc.jpeg', // Replace with your image path
                        width: 450,
                        height: 450,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Beauty is the promise of happiness',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.cyan[800],
                              // color: Color.fromARGB(0, 0, 0, 4),
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 30),
                      backgroundColor: Colors.cyan[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminSignIn()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 30),
                      backgroundColor: Colors.cyan[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.0),
                      ),
                    ),
                    child: const Text(
                      "Admin Panel",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
