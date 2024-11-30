import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/success/success_screen.dart';

class PlaceOrderButton extends StatefulWidget {
  const PlaceOrderButton({super.key});

  @override
  State<PlaceOrderButton> createState() => _PlaceOrderButtonState();
}

class _PlaceOrderButtonState extends State<PlaceOrderButton> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: screenWidth / 1.7,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SuccessScreen(),
              ),
            );
          },
          focusColor: AppColors.white,
          highlightColor: AppColors.blue,
          hoverColor: AppColors.skyBlue,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: ColoredBox(
              color: AppColors.vibrantRed,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "₹183.21",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: "montserratRegular",
                          ),
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.normal,
                            fontFamily: "MontserratRegular",
                          ),
                        )
                      ],
                    ),
                    RichText(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Place Order  ",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: "MontserratRegular",
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
