import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/widgets/text_field_widgets/text_field_widgets.dart';
import 'package:spicypickles/app/presentation/widgets/widget_exports.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> with TextFieldStyle {
  final _profileFormKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // Value Notifiers to track text presence for clear icon visibility
  final ValueNotifier<bool> _nameTextNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _mobileTextNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _emailTextNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _dobTextNotifier = ValueNotifier<bool>(false);

  final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 365 * 18)), // Default 18 years back
      firstDate: DateTime(1980, 1, 1), // Minimum Date
      lastDate: DateTime.now(), // Restrict future dates
    );

    if (pickedDate != null) {
      _dobController.text = _dateFormat.format(pickedDate);
      _dobTextNotifier.value =  _dobController.text.isNotEmpty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: context.textStyle?.labelLarge?.copyWith(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 1,
        shadowColor: AppColors.lynxWhite,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _profileFormKey,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.amber,
                          child: Text(
                            _nameController.text.isNotEmpty ? _nameController.text[0].toUpperCase() : 'T',
                            style: context.textStyle?.headlineLarge?.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -4,
                          right: 0,
                          child: Container(
                            width: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightBlue,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              iconSize: 14,
                              onPressed: () {
                                // Implement profile picture editing
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  _buildTextField(
                    controller: _nameController,
                    label: "Name",
                    notifier: _nameTextNotifier,
                    keyboardType: TextInputType.text,
                    onValidate: validateName,
                  ),
                  _buildTextField(
                    controller: _mobileController,
                    label: "Mobile",
                    notifier: _mobileTextNotifier,
                    keyboardType: TextInputType.phone,
                    onValidate: validateMobile,
                  ),
                  _buildTextField(
                    controller: _emailController,
                    label: "Email",
                    notifier: _emailTextNotifier,
                    keyboardType: TextInputType.emailAddress,
                    onValidate: validateEmail,
                  ),
                  _buildTextField(
                    controller: _dobController,
                    label: "Date of Birth",
                    notifier: _dobTextNotifier,
                    keyboardType: TextInputType.text,
                    onValidate: validateDOB,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 88,
        color: AppColors.bgColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ProceedButton(
          callingAPI: _submitForm,
          buttonWidth: 200,
          borderRadius: 8,
          text: "Update Profile",
          color: AppColors.lightBlue, //Colors.blue.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_profileFormKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      print("Name: ${_nameController.text}");
      print("Mobile: ${_mobileController.text}");
      print("Email: ${_emailController.text}");
      print("Date of Birth: ${_dobController.text}");

      // Add API call or navigation logic here
    } else {
      print("Form contains errors");
    }
  }


  /// Builds a reusable text field widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required ValueNotifier<bool> notifier,
    required TextInputType keyboardType,
    required String? Function(String?) onValidate,
    VoidCallback? onTap,
     bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormFieldWidget(
        maxWidth: double.infinity,
        controller: controller,
        label: label,
        focusedBorder: TextFieldStyle.focusedBorder,
        textInputType: keyboardType,
        actionKeyboard: TextInputAction.next,
        onValidate: onValidate,
        readOnly: readOnly,
        onTap: onTap,
        suffixIcon: ValueListenableBuilder<bool>(
          valueListenable: notifier,
          builder: (context, showIcon, child) {
            return showIcon
                ? InkWell(
                    onTap: () {
                      controller.clear();
                      notifier.value = false;
                    },
                    child: const Icon(Icons.close, size: 20, color: AppColors.black),
                  )
                : const SizedBox.shrink();
          },
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        maxLength: 100,
        onChanged: (value) => notifier.value = controller.text.isNotEmpty,
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers and notifiers to prevent memory leaks
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _nameTextNotifier.dispose();
    _mobileTextNotifier.dispose();
    _emailTextNotifier.dispose();
    _dobTextNotifier.dispose();
    super.dispose();
  }
}
