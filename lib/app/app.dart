import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/repositories/cart_repository.dart';
import 'package:spicypickles/app/data/repositories/product_repository.dart';
import 'package:spicypickles/app/data/repositories/seller_repository.dart';
import 'package:spicypickles/app/presentation/product_details/bloc/product_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/seller_bloc/seller_bloc.dart';
import 'presentation/cart/bloc/cart_bloc.dart';
import 'presentation/home/home.dart';
import 'presentation/notifications/bloc/notification_bloc.dart';
import 'presentation/orders_screen/bloc/orders_bloc.dart';
import 'presentation/store/bloc/store_items_bloc.dart';

class SpicyPickleApp extends StatelessWidget {
  const SpicyPickleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize repositories
    final ProductRepository productRepository = ProductRepository();
    final CartRepository cartRepository = CartRepository();
    final SellerRepository sellerRepository = SellerRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotificationBloc()..add(const FetchNotifications()),
        ),
        BlocProvider(
          create: (_) => StoreItemsBloc(),
        ),
        BlocProvider(
          create: (_) => OrdersBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(productRepository: productRepository),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(cartRepository: cartRepository),
        ),
        BlocProvider<SellerBloc>(
          create: (context) => SellerBloc(sellerRepository: sellerRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Spicy Pickle App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
