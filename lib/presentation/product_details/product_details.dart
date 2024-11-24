import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Product Details Screen", style: context.textStyle?.displayMedium),
    );
  }
}
