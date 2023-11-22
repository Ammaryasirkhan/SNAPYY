import 'package:flutter/material.dart';
import 'package:style_savy/stylewavy/appointments.dart';

class Facial {
  final String name;
  final double price;
  final String image;

  Facial(this.name, this.price, this.image);
}

class FacialPage extends StatefulWidget {
  @override
  _FacialPageState createState() => _FacialPageState();
}

class _FacialPageState extends State<FacialPage> {
  final List<Facial> services = [
    Facial('Normal Facial', 25.0, 'images/f1.jpeg'),
    Facial('Acene Facial', 25.0, 'images/f3.jpeg'),
    Facial('Paraffin Facial', 25.0, 'images/f2.jpeg'),
    Facial('Aromqtherapy Facial', 25.0, 'images/f4.jpeg'),
    Facial('Hydra Facial', 25.0, 'images/f6.jpeg'),

    // Add more services as needed
  ];

  final List<Widget> screens = [
    FacialPage(),
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
        title: Text('Fecial Services'),
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
