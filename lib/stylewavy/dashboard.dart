import 'package:flutter/material.dart';

import 'services.dart';

class Salon {
  final String title;
  final String image;
  final String location;
  final String price;
  final String timings;
  final String description;

  Salon({
    required this.title,
    required this.image,
    required this.location,
    required this.price,
    required this.timings,
    required this.description,
  });
}

class DashboardPage extends StatelessWidget {
  final List<Salon> services = [
    Salon(
      title: 'N A R O S H I A',
      image: "images/salon1.jpg",
      location: 'Chashma',
      price: 'Price info',
      timings: 'Mon-Sat: 9:00 AM - 6:00 PM',
      description:
          'NAROSHIA Salon is a trendy and stylish beauty haven that offers an exquisite range of services to its clients. With a prime location in Chashma, the salon stands out for its exceptional services, dedicated team of professionals, and top-quality beauty products. From haircuts and coloring to luxurious spa treatments, NAROSHIA ensures a rejuvenating and relaxing experience for all its customers. Step into NAROSHIA and indulge in a world of beauty and self-care, where elegance meets excellence..',
    ),
    Salon(
      title: 'G L A M O R',
      image: "images/salon.jpeg",
      location: 'Islamabad',
      price: 'Price info',
      timings: 'Mon-Sat: 10:00 AM - 7:00 PM',
      description:
          'GLAMOUR EMPORIUM Salon is a trendy and stylish beauty haven that offers an exquisite range of services to its clients. With a prime location in Islamabad, the salon stands out for its exceptional services, dedicated team of professionals, and top-quality beauty products. From haircuts and coloring to luxurious spa treatments, GLAMOUR EMPORIUM ensures a rejuvenating and relaxing experience for all its customers. Step into GLAMOUR EMPORIUM and indulge in a world of beauty and self-care, where elegance meets excellence.',
    ),
    Salon(
      title: 'B E A U T Y  L O U N G E',
      image: "images/salon2.jpg",
      location: 'Lahore',
      price: 'Price info',
      timings: 'Mon-Sat: 8:00 AM - 5:00 PM',
      description:
          'BEAUTY LOUNGE Salon is a trendy and stylish beauty haven that offers an exquisite range of services to its clients. With a prime location in Lahore, the salon stands out for its exceptional services, dedicated team of professionals, and top-quality beauty products. From haircuts and coloring to luxurious spa treatments,BEAUTY LOUNGE ensures a rejuvenating and relaxing experience for all its customers. Step into BEAUTY LOUNGE and indulge in a world of beauty and self-care, where elegance meets excellence.',
    ),
    Salon(
      title: 'G O L D E N G L O W',
      image: "images/salon5.jpg",
      location: 'Multan',
      price: 'Price info',
      timings: 'Mon-Sat: 8:00 AM - 5:00 PM',
      description:
          'GOLDEN GLOW Salon is a trendy and stylish beauty haven that offers an exquisite range of services to its clients. With a prime location in Multan, the salon stands out for its exceptional services, dedicated team of professionals, and top-quality beauty products. From haircuts and coloring to luxurious spa treatments, GOLDEN GLOW ensures a rejuvenating and relaxing experience for all its customers. Step into GOLDEN GLOW and indulge in a world of beauty and self-care, where elegance meets excellence.',
    ),
    Salon(
      title: 'R U B A D A',
      image: "images/salon4.jpg",
      location: 'Talagang',
      price: 'Price info',
      timings: 'Mon-Sat: 8:00 AM - 5:00 PM',
      description:
          'RUBADA Salon is a trendy and stylish beauty haven that offers an exquisite range of services to its clients. With a prime location in Talagang, the salon stands out for its exceptional services, dedicated team of professionals, and top-quality beauty products. From haircuts and coloring to luxurious spa treatments, RUBADA ensures a rejuvenating and relaxing experience for all its customers. Step into RUBADA and indulge in a world of beauty and self-care, where elegance meets excellence.',
    ),
    // Add other services here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Column(
        children: [
          SizedBox(height: 27),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: 400,
                    height: 400,
                    child: Card(
                      color: Color.fromARGB(182, 236, 236, 235),
                      elevation: 400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToServiceDetailsPage(context, service);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 11.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                service.image,
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 5),
                              Text(
                                service.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Location: ${service.location}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.cyan[800]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToServiceDetailsPage(BuildContext context, Salon service) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SalonDetails(salon: service),
      ),
    );
  }
}

class SalonDetails extends StatelessWidget {
  final Salon salon;

  SalonDetails({required this.salon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(salon.title),
        centerTitle: true,
        backgroundColor: Colors.cyan[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              salon.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Container(
              width: 300,
              height: 60,
              child: Card(
                color: Colors.cyan[800],
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      salon.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 200,
              height: 50,
              child: Card(
                color: Colors.cyan[800],
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5.0), // Button border radius
                ),
                elevation: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Location: ${salon.location}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Timings: ${salon.timings}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Sunday Off',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description: ${salon.description}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServicesPage()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(180, 45),
                backgroundColor: Colors.cyan[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text(
                "Services",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
