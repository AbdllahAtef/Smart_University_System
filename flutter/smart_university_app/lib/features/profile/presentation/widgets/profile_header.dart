import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String studentId;
  final String avatarPath;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.studentId,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0XFF8B2072), width: 2),
          ),
          child: const CircleAvatar(
            radius: 30,
            child: Icon(Icons.person_2_outlined),
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.textstyle22.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              studentId,
              style: TextStyles.textstyle14.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}


