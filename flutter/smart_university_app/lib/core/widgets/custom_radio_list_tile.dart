import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile({
    super.key,
    required this.selectedRole,
    required this.onChanged,
    required this.role,
  });

  final String selectedRole;
  final Function(String p1) onChanged;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: role,
          groupValue: selectedRole,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) => onChanged(value!),
        ),
        Text(role),
      ],
    );
  }
}
