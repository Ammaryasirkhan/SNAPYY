import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Add this import

class AdminAppointmentsPage extends StatefulWidget {
  @override
  _AdminAppointmentsPageState createState() => _AdminAppointmentsPageState();
}

class _AdminAppointmentsPageState extends State<AdminAppointmentsPage> {
  CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  Future<void> _cancelAppointment(
      String appointmentId, String userFCMToken) async {
    // Delete the appointment from Firestore
    await _appointmentsCollection.doc(appointmentId).delete();
    print('User FCM Token: $userFCMToken');
    if (userFCMToken.isNotEmpty) {
      // Ensure userFCMToken is not empty
      // Send a push notification to the user
      final Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'AAAA6aRO_Xo:APA91bHYptPVBlPDA1yjcd5Hsxt0u4gWW01L4PFvUq1NdOCEueVQWIRlGnyH5GinYTz1Z_O51L1Fmj-Zn2s0Bvr_1JsPvGM3jE5PR4djewi11SpTv1PEs0IkTRzhdmxETGrmiInyw4qN', // Replace with your FCM server key
      };
      final Map<String, dynamic> data = {
        'notification': {
          'title': 'Appointment Rejected',
          'body': 'Your appointment has been rejected by the admin.',
        },
        'data': {
          'type': 'appointment_rejected',
        },
        'to': userFCMToken, // Use the user's FCM token here
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Notification sent successfully');
      } else {
        print('Error sending notification: ${response.reasonPhrase}');
      }
    }
  }

  late Stream<QuerySnapshot> _appointments;

  @override
  void initState() {
    super.initState();
    _appointments = _appointmentsCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Admin Appointments'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _appointments,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No appointments found.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final appointment = snapshot.data!.docs[index];
              final data = appointment.data() as Map<String, dynamic>;
              final appointmentId = appointment.id;
              return Card(
                color: Colors.cyan.withOpacity(0.3),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add_business_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Salon: ${data['salonName']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person_2),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Name: ${data['name']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.description),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Description: ${data['orderDescription']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.contact_page),
                          SizedBox(width: 10),
                          Text('Contact: ${data['contact']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.notifications),
                          SizedBox(width: 10),
                          Text('User FCM Token: ${data['userFCMToken']}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.cyan[800],
                            ),
                            onPressed: () {
                              _cancelAppointment(
                                  appointmentId,
                                  data['userFCMToken'] ??
                                      ''); // Ensure userFCMToken is not null
                            },
                            child: Text('Reject'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
