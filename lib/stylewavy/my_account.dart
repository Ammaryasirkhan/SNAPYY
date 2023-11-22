import 'package:flutter/material.dart';
import 'package:style_savy/Functions/auth_methods.dart';
import 'package:style_savy/Model/user_model.dart';
import 'package:style_savy/Pages/login.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final Auth _auth = Auth();
  User? _user; // Declare _user as nullable User

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  // Function to load user details
  void _loadUserDetails() async {
    User? user = await _auth.getUserDetails();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_user);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_user != null)
              Column(
                children: [
                  Image.asset(
                    'images/ad.png',
                    height: 100,
                    color: Colors.cyan[800],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.cyan[800],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Username: ${_user!.username}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.cyan[800],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Email: ${_user!.email}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.cyan[800],
              ),
              onPressed: () {
                _auth.signOut();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout), // Add a logout icon
                  SizedBox(width: 8),
                  Text('Log Out', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
