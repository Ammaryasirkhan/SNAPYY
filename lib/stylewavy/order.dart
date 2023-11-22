import 'package:flutter/material.dart';
// import 'package:welcome/stylewavy/payment.dart';
import 'package:flutter/services.dart';

import 'services.dart';

class Service {
  final String title;
  final String image;
  final String description;
  final Widget price;

  Service({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });
}

class Orderpage extends StatefulWidget {
  @override
  _OrderpageState createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  int _currentIndex = 0;

  final List<Service> services = [
    Service(
      title: 'Haircuts',
      image: 'images/cuts.png',
      price: Text(
        'PKR 2,000 - PKR 3,000',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 221, 16, 16),
        ),
      ),
      description:
          'Discover a wide range of trendy haircuts, from classic bobs to edgy pixies, expertly crafted by our skilled stylists, designed to transform your look and leave you feeling confident.',
    ),
    Service(
      title: 'Makeup',
      image: 'images/makeup.jpg',
      price: Text(
        'PKR 30,000 - PKR 70,000',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 221, 16, 16),
        ),
      ),
      description:
          'Discover a world of flawless beauty with our salon app. From mesmerizing eyeshadows to radiant blushes, our makeup collection will transform you into a stunning masterpiece.',
    ),
    Service(
      title: 'Facial',
      image: 'images/as.jpg',
      price: Text(
        'PKR 1,500 - PKR 8,000',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 221, 16, 16),
        ),
      ),
      description: '',
    ),
    Service(
      title: 'Manicure/Pedicure',
      image: 'images/facial.jpg',
      price: Text(
        'PKR 1,000 - PKR 3,000',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 221, 16, 16),
        ),
      ),
      description:
          'Experience the ultimate pampering with our luxurious Manicure/Pedicure service. Our skilled technicians will expertly shape, buff, and polish your nails, leaving your hands and feet looking and feeling fabulous.',
    ),
    Service(
      title: 'Hair Dyes',
      image: 'images/hair.jpg',
      price: Text(
        'PKR 4,000 - PKR 15,000',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 221, 16, 16),
        ),
      ),
      description:
          'Discover a spectrum of stunning hair colors at our salon app. From vibrant reds to icy blondes, our professional hair dyes ensure personalized, long-lasting shades that will leave you feeling confident and stylish.',
    ),
  ];

  final List<Widget> screens = [
    ServicesPage(),
    // Orderpage(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Colors.cyan[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
              childAspectRatio: 0.7, // Width to height ratio for each grid item
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final Service service = services[index];
              return Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    // Handle tap event when a service is selected
                    // You can add navigation logic here if needed
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(
                          service.image,
                          fit: BoxFit.fitWidth,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          service.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(service.price as String),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          navigateToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.cyan[800],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Booking',
            backgroundColor: Colors.cyan[800],
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => PaymentPage()),
            //   );
            // },
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Icon for Live Chat
            label: 'Live Chat',
            backgroundColor: Colors.cyan[800],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.cyan[800],
          )
        ],
      ),
    );
  }
}
