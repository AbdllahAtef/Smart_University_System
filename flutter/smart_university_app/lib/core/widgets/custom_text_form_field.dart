import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.isPassword,
    required this.hint,
    this.isID = false,
    this.validator,
  });

  final Function(String)? onChanged;
  final bool isPassword;
  final bool isID;
  final String hint;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.isID ? TextInputType.number : TextInputType.text,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.hint,
          labelStyle: TextStyles.textstyle16.copyWith(
            color: Colors.grey.shade400,
          ),
          enabledBorder: borderLine(),
          focusedBorder: borderLine(),
          errorBorder: borderLine(),
          focusedErrorBorder: borderLine(),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF949494),
                    size: 27.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  UnderlineInputBorder borderLine() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFF949494).withOpacity(0.5)),
    );
  }
}


