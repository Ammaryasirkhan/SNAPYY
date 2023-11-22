import 'package:flutter/material.dart';

class SalonService {
  final String image;
  final String name;
  final double price;

  SalonService({
    required this.image ,required this.name, required this.price});
}

class SalonServices extends StatelessWidget {
  final List<SalonService> services = [
    SalonService(image: 'image/logoo.jpeg' ,name: 'Haircut', price: 20.0 , ),
    SalonService(image: 'images/hair_coloring.jpg' ,name: 'Hair coloring', price: 50.0),
    SalonService(image: 'images/manicure.jpg' ,name: 'Manicure', price: 15.0),
    // Add more services here
  ];

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salon Services'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(services[index].image),
            title: Text(services[index].name),
            subtitle: Text('\$${services[index].price}'),
          );
        },
      ),
    );
  }
}