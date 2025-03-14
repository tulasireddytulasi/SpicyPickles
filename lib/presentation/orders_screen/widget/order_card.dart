import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String restaurantName;
  final String location;
  final String dishName;
  final String price;
  final String orderDate;

  OrderItem({
    required this.restaurantName,
    required this.location,
    required this.dishName,
    required this.price,
    required this.orderDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  restaurantName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Handle more options
                  },
                ),
              ],
            ),
            Text(location, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8.0),
            Text(dishName),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delivered',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text('Order placed on $orderDate', style: const TextStyle(fontSize: 12.0)),
                  ],
                ),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star_border, color: Colors.amber),
                    Icon(Icons.star_border, color: Colors.amber),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle reorder
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Reorder'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}