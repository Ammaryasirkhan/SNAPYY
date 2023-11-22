import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'appointments_list.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _orderDescriptionController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _salonNameController = TextEditingController();

  String _message = '';

  @override
  void dispose() {
    _nameController.dispose();
    _orderDescriptionController.dispose();
    _contactController.dispose();
    _salonNameController.dispose();
    super.dispose();
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Appointment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to make this appointment?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                _submitAppointment();
              },
            ),
          ],
        );
      },
    );
  }

  void _submitAppointment() async {
    String name = _nameController.text;
    String orderDescription = _orderDescriptionController.text;
    String contact = _contactController.text;
    String salonName = _salonNameController.text;

    if (name.isEmpty ||
        orderDescription.isEmpty ||
        contact.isEmpty ||
        salonName.isEmpty) {
      setState(() {
        _message = 'Please fill in all fields';
      });
    } else {
      // Access Firestore database
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Fetch the FCM token for the currently logged-in user
      Object userFCMToken = FirebaseMessaging.instance.getToken() ?? '';

      // Create a map with appointment data
      Map<String, dynamic> appointmentData = {
        'name': name,
        'orderDescription': orderDescription,
        'contact': contact,
        'salonName': salonName,
        'userId':
            FirebaseAuth.instance.currentUser!.uid, // Use the current user's ID
        'userFCMToken': userFCMToken, // Include the FCM token
      };

      try {
        // Add the appointment to the "appointments" collection
        await firestore.collection('appointments').add(appointmentData);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentsListPage(
              userId: FirebaseAuth.instance.currentUser!.uid,
            ),
          ),
        );

        setState(() {
          _message = 'Appointment made successfully!';
        });

        _nameController.clear();
        _orderDescriptionController.clear();
        _contactController.clear();
        _salonNameController.clear();
      } catch (error) {
        setState(() {
          _message = 'Error making appointment: $error';
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_message),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
        backgroundColor:
            Colors.cyan[800], // Replace 'Colors.blue' with your desired color
      ),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person, color: Colors.cyan[800]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Color(0xfff5f8fd),
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _orderDescriptionController,
              decoration: InputDecoration(
                labelText: 'Order Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Color(0xfff5f8fd),
                hintText: 'Enter order description',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Contact',
                prefixIcon: Icon(Icons.contact_page, color: Colors.cyan[800]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Color(0xfff5f8fd),
                hintText: 'Enter contact',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _salonNameController,
              decoration: InputDecoration(
                labelText: 'Salon Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Color(0xfff5f8fd),
                hintText: 'Enter salon name',
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: _showConfirmationDialog,
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan[800], // Background color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.all(15), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(27.0), // Button border radius
                ),
                elevation: 4, // Button elevation (shadow)
              ),
              child: Text(
                "Submit Appointment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
