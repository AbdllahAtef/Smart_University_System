import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/widgets/custom_radio_list_tile.dart';

class RoleSelector extends StatelessWidget {
  final String selectedRole;
  final Function(String) onChanged;

  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Role",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadioListTile(
              selectedRole: selectedRole,
              onChanged: onChanged,
              role: 'Student',
            ),

            CustomRadioListTile(
              selectedRole: selectedRole,
              onChanged: onChanged,
              role: 'Doctor',
            ),
            SizedBox(width: 50.w),
          ],
        ),
      ],
    );
  }
}

