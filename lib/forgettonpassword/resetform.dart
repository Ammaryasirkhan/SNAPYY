import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../back.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Reset Password'),
      ),
      body: Container(
        color: Color.fromRGBO(118, 202, 223, 0.29),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            SizedBox(height: 30),
            Text(
              'Enter your email to reset your password',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 9, vertical: 9), // Decrease the box size
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                 var email;
                 await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .then((value) => Navigator.of(context).pop());
                // Implement your reset password logic here
               
                
               
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(120, 40), // Decrease the box size
                primary: Colors.cyan[800], // Set the background color
              ),
              child: Text(
                'Send request',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.person,
          color: Colors.white, size: 140), // Increase icon size
      padding: EdgeInsets.all(20), // Add padding around the icon
    );
  }
}
