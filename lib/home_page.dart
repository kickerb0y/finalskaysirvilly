import 'package:flutter/material.dart';
import 'order_page.dart';
import 'account_page.dart';

class Service {
  final String title;
  final IconData icon;
  final String imagePath;

  Service({required this.title, required this.icon, required this.imagePath});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Order> _orders = [];

  final List<Service> services = [
    Service(
        title: 'Caramel Macchiato',
        icon: Icons.coffee,
        imagePath: 'assets/images/caramelmacchiato.png'),
    Service(
        title: 'Iced Matcha',
        icon: Icons.coffee,
        imagePath: 'assets/images/icedmatcha.png'),
    Service(
        title: 'Black Coffee',
        icon: Icons.coffee,
        imagePath: 'assets/images/blackcoffee.png'),
    Service(
        title: 'Espresso',
        icon: Icons.coffee,
        imagePath: 'assets/images/espresso.png'),
    Service(
        title: 'Latte',
        icon: Icons.coffee,
        imagePath: 'assets/images/latte.png'),
    Service(
        title: 'Cappuccino',
        icon: Icons.coffee,
        imagePath: 'assets/images/cappuccino.png'),
    Service(
        title: 'Vanilla Latte',
        icon: Icons.coffee,
        imagePath: 'assets/images/vanillalatte.png'),
    Service(
        title: 'Burger',
        icon: Icons.emoji_food_beverage,
        imagePath: 'assets/images/burger.png'),
    Service(
        title: 'Fries',
        icon: Icons.emoji_food_beverage,
        imagePath: 'assets/images/fries.png'),
    Service(
        title: 'Cookie',
        icon: Icons.emoji_food_beverage,
        imagePath: 'assets/images/cookie.png'),
    // Add more services as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      // Navigate to Orders page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(orders: _orders),
        ),
      );
    } else if (index == 2) {
      // Navigate to Account page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountPage()),
      );
    }
  }

  void _addOrder(Service service) {
    setState(() {
      _orders.add(Order(
        productName: service.title,
        quantity: 1,
        price: 5.0, // Set a fixed price for simplicity
        orderDate: DateTime.now(),
      ));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${service.title} added to orders'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 170, 136, 105), // Background color of the homepage
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color.fromARGB(255, 209, 206, 206),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.asset(
                        services[index].imagePath,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        leading: Icon(
                          services[index].icon,
                          color: Colors.brown,
                        ),
                        title: Text(
                          services[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            _addOrder(services[index]);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Order'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        onTap: _onItemTapped,
      ),
    );
  }
}
