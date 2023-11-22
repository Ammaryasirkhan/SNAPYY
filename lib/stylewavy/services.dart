import 'package:flutter/material.dart';

import 'Fecial.dart';

import 'Hairdye.dart';
import 'Pedicure.dart';
import 'haircuts.dart';

import 'mekeup.dart';
// import 'appointments.dart';

class Service {
  final String title;
  final String image;

  Service({
    required this.title,
    required this.image,
  });
}

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Service> services = [
    Service(
      title: 'Haircuts',
      image: 'images/cuts.png',
    ),
    Service(
      title: 'Makeup',
      image: 'images/makeup.jpg',
    ),
    Service(
      title: 'Facial',
      image: 'images/as.jpg',
    ),
    Service(
      title: 'Manicure/Pedicure',
      image: 'images/facial.jpg',
    ),
    Service(
      title: 'Hair Dyes',
      image: 'images/hair.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Colors.cyan[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.10),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final Service service = services[index];
                  return GestureDetector(
                      onTap: () {
                        // Use Navigator to push a different page for each service
                        if (service.title == 'Haircuts') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HaircutsPage(),
                            ),
                          );
                        } else if (service.title == 'Makeup') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MakeUpPage(),
                            ),
                          );
                        } else if (service.title == 'Facial') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FacialPage(),
                            ),
                          );
                        } else if (service.title == 'Manicure/Pedicure') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PedicurePage(),
                            ),
                          );
                        } else if (service.title == 'Hair Dyes') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HairdyesPage(),
                            ),
                          );
                        }
                      },
                      child: Card(
                          elevation: 40,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    service.image,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    service.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
