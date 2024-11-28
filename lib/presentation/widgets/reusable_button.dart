import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';

class ProceedButton extends StatelessWidget {
  final String text;
  final void Function() callingAPI;
  final double buttonWidth;
  final double topPadding;
  final double bottomPAdding;
  final Color color;
  final double borderRadius;
  final Widget? childWidget;
  const ProceedButton({
    super.key,
    required this.text,
    required this.callingAPI,
    required this.buttonWidth,
    this.topPadding = 14,
    this.bottomPAdding = 14,
    this.color = Colors.green,
    this.borderRadius = 25,
    this.childWidget,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 1)),
      child: ElevatedButton(
        onPressed: callingAPI,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Container(
          alignment: Alignment.center,
          width: buttonWidth,
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          padding: EdgeInsets.only(bottom: bottomPAdding, top: topPadding),
          child: childWidget ??
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "montserratRegular",
                  color: AppColors.white,
                ),
              ),
        ),
      ),
    );
  }
}
