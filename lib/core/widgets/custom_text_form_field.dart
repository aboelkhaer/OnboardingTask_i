import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String validateMsg;
  final bool isSecure;
  final Widget? prefix;
  final TextInputType textInputType;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.title,
    required this.validateMsg,
    required this.textInputType,
    this.prefix,
    this.isSecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: (value) {
          return value!.isNotEmpty ? null : validateMsg;
        },
        controller: controller,
        keyboardType: textInputType,
        obscureText: isSecure,
        decoration: InputDecoration(
          prefixIcon: prefix,
          hintText: title,
          helperMaxLines: 1,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
