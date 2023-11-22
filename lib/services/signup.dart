import 'package:style_savy/Functions/auth_methods.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Import Firebase Messaging
import 'package:flutter/material.dart';
import '../Pages/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  String _fcmToken = '';

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    // Fetch the FCM token
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? fcmToken = await messaging.getToken();

    String response = await Auth().signUpUser(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      username: _usernamecontroller.text,
      fcmToken: fcmToken ?? '',
    );

    setState(() {
      _isLoading = false;
    });

    if (response == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your account has been created successfully.'),
          duration: const Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign Up Page'),
        centerTitle: true,
        backgroundColor: Colors.cyan[800],
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
                SizedBox(height: 120.0),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 219, 216, 216),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(146, 64, 63, 63),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Logo at the top with a borderRadius
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            80), // Adjust the radius as needed
                        child: Image.asset(
                          'images/alogo.png', // Replace with your logo image path
                          width: 150, // Set the desired image width
                          height: 120, // Set the desired image height
                        ),
                      ),
                      Container(
                        //

                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff5f8fd),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: TextField(
                          controller: _usernamecontroller,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.cyan[800],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color(0xffe1e2e3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
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
                              Icons.email,
                              color: Colors.cyan[800],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Color(0xffe1e2e3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff5f8fd),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: _passwordcontroller,
                          obscureText: true,
                          // ignore: prefer_const_constructors
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
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.cyan[800],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: const Color.fromRGBO(0, 131, 143, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xfff5f8fd),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            // controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
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
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 28.0),
                      ElevatedButton(
                        onPressed: signUpUser,
                        style: TextButton.styleFrom(
                          fixedSize: Size(170, 30),
                          backgroundColor: Colors.cyan[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      // Text(
                      //   errorText,
                      //   style: TextStyle(color: Colors.red),
                      // ),
                      SizedBox(height: 16.0),
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
