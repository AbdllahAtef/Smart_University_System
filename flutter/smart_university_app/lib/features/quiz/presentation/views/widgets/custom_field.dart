import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.initialValue,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  final String? initialValue;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      keyboardType: keyboardType,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}
