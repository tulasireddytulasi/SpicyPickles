import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spicypickles/core/theme/light_theme.dart';
import 'package:spicypickles/core/utils/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction? actionKeyboard;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? onValidate;
  final int? maxLength;
  final String? suffixText;
  final double maxWidth;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onClick;
  final bool isOnClickDisabled;
  final bool readOnly;

  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.textInputType,
    required this.controller,
    this.actionKeyboard = TextInputAction.next,
    this.inputFormatters,
    required this.onChanged,
    this.onValidate,
    this.maxLength,
    this.suffixText,
    required this.maxWidth,
    this.contentPadding,
    this.onClick,
    this.isOnClickDisabled = false,
    this.readOnly = false,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late ThemeData themeProvider;
  late Color primaryColor, primaryContainer, secondaryColor;

  @override
  void initState() {
    super.initState();
    themeProvider = LightTheme().themeData;
    primaryColor = themeProvider.colorScheme.primary;
    primaryContainer = Colors.transparent; //themeProvider.colorScheme.onPrimary;
    secondaryColor = themeProvider.colorScheme.secondary.withOpacity(0.4);
  }

  @override
  Widget build(BuildContext context) {
    //  bool isDesktopScreen = isDesktop(screenWidth: widget.maxWidth);
    return TextFormField(
      readOnly: widget.readOnly,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      style: themeProvider.textTheme.labelMedium?.copyWith(fontSize: 14, color: AppColors.deepRed),
      cursorColor: themeProvider.colorScheme.primary,
      onChanged: (String? newValue) {
        widget.onChanged(newValue);
      },
      onFieldSubmitted: (value) => widget.onClick?.call(value),
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 14,
            ),
        hintText: widget.hintText,
        hintStyle: themeProvider.inputDecorationTheme.hintStyle?.copyWith(fontSize: 14),
        errorMaxLines: 3,
        counterText: "",
      ),
      controller: widget.controller,
      validator: widget.onValidate,
    );
  }
}

bool isDesktop({required double screenWidth}) {
  bool isDesktop = screenWidth >= 700;
  return isDesktop;
}
