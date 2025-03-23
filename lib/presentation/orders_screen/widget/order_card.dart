import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_enums.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/orders_model.dart';
import 'package:spicypickles/presentation/orders_screen/widget/non_veg_icon.dart';
import 'package:spicypickles/presentation/orders_screen/widget/star_rating_widget.dart';
import 'package:spicypickles/presentation/widgets/dash_line_divider_widget.dart';

class OrderItem extends StatelessWidget {
  final Orders orders;

  OrderItem({required this.orders});

  String getOrderStatusString(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.returned:
        return 'Returned';
      case OrderStatus.failed:
        return 'Failed';// Handle unexpected cases
    }
  }

  Color getOrderStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.processing:
        return Colors.blue;
      case OrderStatus.shipped:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.green[800]!;
      case OrderStatus.cancelled:
        return Colors.red;
      case OrderStatus.returned:
        return Colors.purple;
      case OrderStatus.failed:
        return Colors.grey;
      default:
        return Colors.black; // Default color for unknown status
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.lightGrey),
      ),
      color: AppColors.white,
      elevation: 4,
      shadowColor: Colors.blue.withValues(alpha: 0.4),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          AppAssets.kPickle8,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders.restaurantName ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: context.screenWidth / 1.7,
                            child: Text(
                              orders.restaurantLocation ?? "",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Divider(color: AppColors.lightGrey, thickness: 1.2),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  orders.items?.length ?? 0,
                  (index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: CustomButton(),
                        ),
                        SizedBox(width: 6),
                        Flexible(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "${orders.items?[index].noOfItems} x ",
                                style: context.textStyle?.titleMedium?.copyWith(color: AppColors.grey),
                              ),
                              TextSpan(
                                text: orders.items?[index].itemName,
                                style: context.textStyle?.titleMedium?.copyWith(color: AppColors.black),
                              )
                            ]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const DashLineDivider(color: AppColors.lightGrey, dashWidth: 4.0, dashSpace: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order placed on ${orders.orderDate ?? ""}',
                        style: context.textStyle?.titleMedium,
                      ),
                      Text(
                        getOrderStatusString(orders.orderStatus!),
                        style: context.textStyle?.titleMedium?.copyWith(
                          color: getOrderStatusColor(orders.orderStatus!),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("₹" + orders.totalPrice.toString(), style: context.textStyle?.labelLarge),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Divider(color: AppColors.lightGrey, thickness: 1.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Rate",
                        style: context.textStyle?.labelLarge?.copyWith(color: AppColors.black),
                      ),
                      SizedBox(width: 6),
                      StarRating(
                        initialRating: 3,
                        maxRating: 5,
                        starSpacing: 6,
                        onRatingChanged: (rating) {
                          print('New rating: $rating');
                        },
                        starSize: 24,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle reorder
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    child: Text(
                      'Reorder',
                      style: context.textStyle?.titleMedium?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}