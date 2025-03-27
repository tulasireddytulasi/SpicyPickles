import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

mixin TextFieldStyle {
  static InputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.black, width: 2),
  );

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return "Name can only contain letters and spaces";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    // Regex pattern for validating email
    final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validateDOB(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Date of Birth is required";
    }
    final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");
    try {
      DateTime dob = _dateFormat.parse(value);
      DateTime today = DateTime.now();
      DateTime minDate = DateTime(1980, 1, 1);

      if (dob.isAfter(today)) {
        return "Future dates are not allowed";
      }
      if (dob.isBefore(minDate)) {
        return "DOB should be after 01/01/1980";
      }
    } catch (e) {
      return "Invalid Date Format (Use DD/MM/YYYY)";
    }

    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Mobile number is required";
    }
    if (!RegExp(r"^[6-9]\d{9}$").hasMatch(value)) {
      return "Enter a valid 10-digit mobile number";
    }
    return null;
  }
}
