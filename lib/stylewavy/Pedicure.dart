import 'package:flutter/material.dart';
import 'package:style_savy/stylewavy/appointments.dart';

import '../adminpanel/appointment_admin.dart';

class Pedicure {
  final String name;
  final double price;
  final String image;

  Pedicure(this.name, this.price, this.image);
}

class PedicurePage extends StatefulWidget {
  @override
  _PedicurePageState createState() => _PedicurePageState();
}

class _PedicurePageState extends State<PedicurePage> {
  final List<Pedicure> services = [
    Pedicure('Pedicure', 25.0, 'images/m5.jpeg'),
    Pedicure('manicure', 25.0, 'images/m3.jpeg'),
    Pedicure('Nails Pedicular ', 25.0, 'images/m2.jpeg'),
    Pedicure('Nails Manicular', 25.0, 'images/m4.jpeg'),
    Pedicure('Pedicure', 25.0, 'images/m1.jpeg'),

    // Add more services as needed
  ];

  final List<Widget> screens = [
    PedicurePage(),
    Appointments(),
    // AccountPage(),
  ];

  void navigateToPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedicure & Manicure Services'),
        backgroundColor: Colors.cyan[800],
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Container(
            margin: EdgeInsets.only(left: 5, top: 10),
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Appointments(),
                      ));
                    },
                    child: Image.asset(
                      service.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Text(
                        service.name,
                        style: TextStyle(
                          fontSize:
                              18, // You can adjust the font size as needed
                          fontWeight:
                              FontWeight.bold, // You can change the font weight
                        ),
                      ),
                      Text(
                        '\$${service.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize:
                              16, // You can adjust the font size as needed
                          color: Colors.grey, // You can change the text color
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              )
            ]),
          );
        },
      ),
    );
  }
}
