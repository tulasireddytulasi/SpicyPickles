import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/orders_screen/bloc/orders_bloc.dart';

import 'widget/order_card.dart';
import 'widget/shimmer_effect.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  void initState() {
    super.initState();
    context.read<OrdersBloc>().add(FetchOrdersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state == OrdersLoading()) {
            return ShimmerEffect();
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by restaurant or dish',
                    hintStyle: context.textStyle?.titleMedium?.copyWith(
                      fontFamily: 'MontserratSemiBold',
                      color: AppColors.grey,
                    ),
                    prefixIcon: Icon(Icons.search, color: AppColors.crimson),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
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
          );
        },
      ),
    );
  }
}