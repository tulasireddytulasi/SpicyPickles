// Purpose: The floating button displaying item count and total cart value.
// File: floating_cart_button.dart
// Folder: lib/presentation/widgets/common/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';

class FloatingCartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingCartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int itemCount = 0;
        double cartTotal = 0.0;
        bool isCartEmpty = true;

        if (state is CartLoaded2) {
          itemCount = state.items.fold(0, (sum, item) => sum + item.quantity);
          cartTotal = state.total;
          isCartEmpty = state.items.isEmpty;
        }

        return Positioned(
          bottom: 96, // Adjusted to be above the bottom navigation bar (64px height + 32px padding)
          right: 16, // right-4 in Tailwind
          child: AnimatedOpacity(
            opacity: isCartEmpty ? 0.0 : 1.0, // Hide if cart is empty
            duration: const Duration(milliseconds: 300),
            child: IgnorePointer( // Prevent taps when hidden
              ignoring: isCartEmpty,
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // p-3 in HTML is more like 12px padding
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor, // bg-primary
                    borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.shopping_cart, // ri-shopping-cart-2-fill
                        color: AppTheme.whiteColor,
                        size: 24, // ri-lg
                      ),
                      const SizedBox(width: 8), // ml-2
                      Text(
                        '$itemCount item${itemCount != 1 ? 's' : ''}', // 0 items, 1 item, 2 items
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500, // font-medium
                          color: AppTheme.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 4), // mx-1 (half of 8)
                      Container(
                        width: 1,
                        height: 20,
                        color: AppTheme.whiteColor.withValues(alpha: 0.5), // Separator line
                      ),
                      const SizedBox(width: 4), // mx-1
                      Text(
                        '\$${cartTotal.toStringAsFixed(2)}', // $0.00
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500, // font-medium
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
