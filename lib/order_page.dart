import 'package:flutter/material.dart';

class Order {
  final String productName;
  final int quantity;
  final double price;
  final DateTime orderDate;

  Order({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.orderDate,
  });
}

class OrderPage extends StatefulWidget {
  final List<Order> orders;

  const OrderPage({super.key, required this.orders});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void _checkout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Checkout Confirmation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to proceed to checkout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Checkout'),
              onPressed: () {
                // Implement checkout logic here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Checkout successful!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteOrder(int index) {
    setState(() {
      widget.orders.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order deleted'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: widget.orders.isEmpty
          ? const Center(
              child: Text(
                'No orders available',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : ListView.builder(
              itemCount: widget.orders.length,
              itemBuilder: (context, index) {
                final order = widget.orders[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15.0),
                    title: Text(
                      order.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5.0),
                        Text(
                          'Quantity: ${order.quantity}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Total Price: \$${(order.price * order.quantity).toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Order Date: ${order.orderDate.toLocal().toString().split(' ')[0]}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            _deleteOrder(index);
                          },
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () {
                      // Implement order details navigation or other functionality
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _checkout(context),
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Checkout'),
        backgroundColor: Colors.blue,
        tooltip: 'Checkout',
      ),
    );
  }
}
