import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/state_item.dart';

class ProfileCard extends StatelessWidget {
  final String email;
  final String id;
  final String faculty;

  const ProfileCard({
    super.key,
    required this.email,
    required this.id,
    required this.faculty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: StateItem(value: email, label: 'Email'),
          ),

          Expanded(
            child: StateItem(value: id, label: 'National ID'),
          ),

          Expanded(
            child: StateItem(value: faculty, label: 'Faculty'),
          ),
        ],
      ),
    );
  }
}

