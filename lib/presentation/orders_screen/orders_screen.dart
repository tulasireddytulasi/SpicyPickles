import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isLoading = true; // Initially set to true for shimmer effect

  @override
  void initState() {
    super.initState();
    // Simulate loading data (replace with your actual data fetching)
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by restaurant or dish',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading ? _buildShimmerList() : ListView(
              children: [
                OrderItem(
                  restaurantName: 'Faasos - Wraps, Rolls ...',
                  location: 'Kumnunchull, Bangalore',
                  dishName: 'Special Smoky Chicken Shawarma',
                  price: '₹216.50',
                  orderDate: '20 Mar, 8:10PM',
                ),
                OrderItem(
                  restaurantName: 'Pot Biryani',
                  location: 'Mogwons, Bongelere',
                  dishName: 'Chicken Boneless Biryani',
                  price: '₹195.00',
                  orderDate: '10 Mar, 8:10PM',
                ),
                OrderItem(
                  restaurantName: 'Faasos - Wraps, Rolls ...',
                  location: 'Kammanchall, Bangalore',
                  dishName: 'Special Smoky Chicken Shawarma',
                  price: '₹226.21',
                  orderDate: '14 Feb, 12:27AM',
                ),
                OrderItem(
                  restaurantName: 'Faasos - Wraps, Rolls ...',
                  location: 'Kummanchall, Bangalore',
                  dishName: 'Classic Smoky Chicken Shawarma',
                  price: '₹190.27',
                  orderDate: '11 Feb, 7:47PM',
                ),
                OrderItem(
                  restaurantName: 'Paradise Biryani - A L ...',
                  location: 'Habbol, Sampalors',
                  dishName: 'Rayal Chicken Dum Biryani (Serves 1)',
                  price: '₹245.00',
                  orderDate: '07 Feb, 9:53PM',
                ),
                OrderItem(
                  restaurantName: 'Rolls On Wheels - Sha ...',
                  location: 'Hennur, Bangalore',
                  dishName: 'Chicken Tikka Roll',
                  price: '₹206.00',
                  orderDate: '06 Feb, 11:00PM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
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

Widget _buildShimmerList() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 5, // Number of shimmer placeholders
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 20.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: 150.0,
                  height: 16.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80.0,
                      height: 16.0,
                      color: Colors.white,
                    ),
                    Container(
                      width: 60.0,
                      height: 32.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}