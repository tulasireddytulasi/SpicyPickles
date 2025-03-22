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
        title: Text('Your Orders', style: context.textStyle?.labelLarge?.copyWith(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
          if(state == OrdersLoaded(ordersList: [])){
           (state as OrdersLoaded);
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
                      prefixIcon: Icon(Icons.search, color: AppColors.crimson, size: 22,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.ordersList.length,
                    separatorBuilder: (context, index) => SizedBox.shrink(),
                    itemBuilder: (context, index) {
                      return OrderItem(
                        orders: state.ordersList[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Center(child: Text("No Orders"),);
        },
      ),
    );
  }
}