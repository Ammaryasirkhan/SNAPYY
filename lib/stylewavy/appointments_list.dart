import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsListPage extends StatefulWidget {
  final String userId;

  AppointmentsListPage({required this.userId});

  @override
  _AppointmentsListPageState createState() => _AppointmentsListPageState();
}

class _AppointmentsListPageState extends State<AppointmentsListPage> {
  CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  late Stream<QuerySnapshot> _appointments;

  @override
  void initState() {
    super.initState();
    _appointments = _appointmentsCollection
        .where('userId', isEqualTo: widget.userId)
        .snapshots();
  }

  Future<void> _cancelAppointment(String appointmentId) async {
    await _appointmentsCollection.doc(appointmentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Your Appointments'),
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
                            SizedBox(
                              width: 10,
                            ),
                            Text('Contact: ${data['contact']}'),
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
                                _cancelAppointment(appointmentId);
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
