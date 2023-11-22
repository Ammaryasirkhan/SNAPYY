import 'package:flutter/material.dart';
import 'adminpanel.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({Key? key}) : super(key: key);

  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  var passwordCtrl = TextEditingController();
  late String password;

  void navigateToAdminPage() {
    if (password == 'Admin123') {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AdminPage(),
      ));
    } else {
      // Password is incorrect
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Admin Password'),
            content: Text('Please enter the correct admin password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.cyan[800]!,
                blurRadius: 10,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.cyan[800],
                    borderRadius: BorderRadius.circular(27)),
                child: Center(
                  child: const Text(
                    'StyelSavy',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to Admin Panel',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  child: TextFormField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.only(right: 0, left: 10),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[300],
                          child: IconButton(
                            icon: const Icon(Icons.close, size: 15),
                            onPressed: () {
                              passwordCtrl.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) return "Password can't be empty";
                    },
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.cyan[800],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 10,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: const Text(
                    'Sign In',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: navigateToAdminPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
