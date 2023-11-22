import 'package:flutter/material.dart';
import '../services/signup.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(188, 239, 215, 203),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 228, 179, 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We will Provide you the best services from our Style Savy. Thank You for watching us!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 185, 9),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      // image: AssetImage("images/s.png"),
                      ),
                ),
                // ),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 30),
                        backgroundColor: Color.fromARGB(255, 231, 181, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              27.0), // Button border radius
                        ),
                        // Set the background color of the Login button
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 30),
                        backgroundColor: Color.fromARGB(255, 187, 226, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              27.0), // Button border radius
                        ),
                        // Set the background color of the Sign Up button
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Online Salon Services',
    home: HomePage(),
  ));
}
