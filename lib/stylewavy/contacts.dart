import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Contact'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            ContactInfoSection(),
            SizedBox(height: 32),
            OpeningHoursSection(),
          ],
        ),
      ),
    );
  }
}

class ContactInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.cyan[800], borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        ContactDetail(
          icon: Icons.phone,
          text: '+92 123 456 7890',
        ),
        ContactDetail(
          icon: Icons.email,
          text: 'najmasadia78@gmail.com',
        ),
        ContactDetail(
          icon: Icons.location_on,
          text: '1234 Salon Street, City, Pakistan',
        ),
      ],
    );
  }
}

class ContactDetail extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactDetail({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class OpeningHoursSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.cyan[800], borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            'Opening Hours',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        OpeningHoursItem(
          day: 'Monday - Friday',
          hours: '9:00 AM - 7:00 PM',
        ),
        OpeningHoursItem(
          day: 'Saturday',
          hours: '10:00 AM - 6:00 PM',
        ),
        OpeningHoursItem(
          day: 'Sunday',
          hours: 'Closed',
        ),
      ],
    );
  }
}

class OpeningHoursItem extends StatelessWidget {
  final String day;
  final String hours;

  OpeningHoursItem({required this.day, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Text(
          day,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          hours,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
