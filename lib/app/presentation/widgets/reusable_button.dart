import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

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
    this.color = AppColors.crimson,
    this.borderRadius = 25,
    this.childWidget,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callingAPI,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Container(
        alignment: Alignment.center,
        width: buttonWidth,
        //decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        padding: EdgeInsets.only(bottom: bottomPAdding, top: topPadding),
        child: childWidget ??
            Text(
              text,
              style: context.textStyle?.titleLarge,
            ),
      ),
    );
  }
}
