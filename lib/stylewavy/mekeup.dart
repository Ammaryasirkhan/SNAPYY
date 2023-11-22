import 'package:flutter/material.dart';
import 'package:style_savy/stylewavy/appointments.dart';

import '../adminpanel/appointment_admin.dart';

class MakeUp {
  final String name;
  final double price;
  final String image;

  MakeUp(this.name, this.price, this.image);
}

class MakeUpPage extends StatefulWidget {
  @override
  _MakeUpPageState createState() => _MakeUpPageState();
}

class _MakeUpPageState extends State<MakeUpPage> {
  final List<MakeUp> services = [
    MakeUp('Party makeup', 25.0, 'images/makeup2.jpeg'),
    MakeUp('Mehndi makeup', 25.0, 'images/makeup20.jpeg'),
    MakeUp('Bridal amkeup', 25.0, 'images/makeup1.jpeg'),
    MakeUp('Walimma Makeup', 25.0, 'images/makeup22.jpeg'),

    // Add more services as needed
  ];

  final List<Widget> screens = [
    MakeUpPage(),
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
        title: Text('MakeUp Services'),
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
