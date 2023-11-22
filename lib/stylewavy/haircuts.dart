import 'package:flutter/material.dart';

import '../adminpanel/appointment_admin.dart';
import 'appointments.dart';

class Haircuts {
  final String name;
  final double price;
  final String image;

  Haircuts(this.name, this.price, this.image);
}

class HaircutsPage extends StatefulWidget {
  @override
  _HaircutsPageState createState() => _HaircutsPageState();
}

class _HaircutsPageState extends State<HaircutsPage> {
  final List<Haircuts> services = [
    Haircuts('Curly Bob', 25.0, 'images/hc2.jpeg'),
    Haircuts('Coquettish Waves', 25.0, 'images/h2.jpeg'),
    Haircuts('Sharp bob', 25.0, 'images/hc1.jpeg'),
    Haircuts('Curlywith', 25.0, 'images/h1.jpeg'),

    // Add more services as needed
  ];

  final List<Widget> screens = [
    HaircutsPage(),
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
        title: Text('HairCuts Services'),
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
