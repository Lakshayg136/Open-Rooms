import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      this.readOnly = false,
      required this.controller,
      required this.hintText,
      this.isObscureText = false,
      this.onTap});

  final bool readOnly;
  final TextEditingController? controller;
  final String hintText;
  final bool isObscureText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      style: TextStyle(color: Pallete.textColor),
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: isObscureText,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing.";
        }
        return val;
      },
    );
  }
}
