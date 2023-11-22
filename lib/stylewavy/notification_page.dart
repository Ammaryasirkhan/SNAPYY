import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Notifications'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Your Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            NotificationCard(
              title: 'Appointment Reminder',
              message: 'You have an appointment at 3:00 PM today.',
              timestamp: 'Today, 2:30 PM',
            ),
            NotificationCard(
              title: 'New Offer',
              message: 'Get 20% off on all services this weekend.',
              timestamp: 'Yesterday, 5:45 PM',
            ),
            // Add more NotificationCard widgets for additional notifications
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String timestamp;

  NotificationCard({
    required this.title,
    required this.message,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.notifications),
        title: Text(title),
        subtitle: Text(message),
        trailing: Text(timestamp),
      ),
    );
  }
}
