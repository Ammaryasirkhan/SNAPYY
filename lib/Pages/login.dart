import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:style_savy/Functions/auth_methods.dart';
import 'package:style_savy/services/signup.dart';

import '../stylewavy/mainpage.dart'; // Make sure this import is correct

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String response = await Auth().loginUser(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
    );
    if (response == 'success') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => mainpage()));
    } else {}

    setState(() {
      _isLoading = false;
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 247, 248),
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor:
            Colors.cyan[800], // Replace 'Colors.blue' with your desired color
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 150.0), // You can adjust the spacing

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 219, 216, 216),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 14, 13, 13)
                            .withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Logo at the top with a borderRadius
                      ClipRRect(
                        child: Image.asset(
                          'images/alogo.png',
                          // Replace with your logo image path
                          width: 120, // Set the desired image width
                          height: 120,
                          // Set the desired image height
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff5f8fd),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: TextField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.cyan[800],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Color(0xfff5f8fd),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff5f8fd),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: TextField(
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              // Use an IconButton for the password toggle
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.cyan[800],
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.cyan[800]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Color(0xfff5f8fd),
                              ),
                            ),
                          ),
                          obscureText:
                              _obscureText, // Use the _obscureText variable
                        ),
                      ),

                      // Text(
                      //   'Login failed. Please check your credentials.',
                      //   style: TextStyle(color: Colors.red),
                      // ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: loginUser,
                        style: TextButton.styleFrom(
                          fixedSize: Size(170, 30),
                          backgroundColor: Colors.cyan[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Does not have an account?'),
                          TextButton(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 131, 143,
                                      1)), // Change 'Colors.blue' to your desired color
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
