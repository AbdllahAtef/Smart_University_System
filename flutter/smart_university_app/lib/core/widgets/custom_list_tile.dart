import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyles.textstyle16.copyWith(color: Colors.black87),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
    );
  }
}


