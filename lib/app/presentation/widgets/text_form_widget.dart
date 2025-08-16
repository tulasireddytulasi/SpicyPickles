import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spicypickles/app/core/theme/light_theme.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
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
  final VoidCallback? onTap;
  final bool isOnClickDisabled;
  final bool readOnly;
  final String? label;
  final InputBorder? focusedBorder;
  final FocusNode? focusNode;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
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
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.focusedBorder,
    this.onTap,
    this.focusNode,
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
    secondaryColor = themeProvider.colorScheme.secondary.withValues(alpha: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    //  bool isDesktopScreen = isDesktop(screenWidth: widget.maxWidth);
    return TextFormField(
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      style: themeProvider.textTheme.labelLarge?.copyWith(fontSize: 14, color: AppColors.black),
      cursorColor: AppColors.black,
      onChanged: (String? newValue) {
        widget.onChanged(newValue);
      },
      onFieldSubmitted: (value) => widget.onClick?.call(value),
      onTap: widget.onTap,
      decoration: InputDecoration(
        label: (widget.label != null)
            ? Text(
                widget.label ?? "",
                style: context.textStyle?.titleMedium?.copyWith(
                  color: AppColors.grey,
                ),
              )
            : null,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 14,
            ),
        hintText: widget.hintText,
        hintStyle: themeProvider.inputDecorationTheme.hintStyle?.copyWith(fontSize: 14, color: AppColors.grey),
        errorMaxLines: 3,
        counterText: "",
        prefixIcon:  widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        focusedBorder: widget.focusedBorder,
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
