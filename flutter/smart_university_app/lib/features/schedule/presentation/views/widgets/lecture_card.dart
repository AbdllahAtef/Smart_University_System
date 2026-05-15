import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.room,
    required this.instructor,
    required this.color,
    this.onPressed,
  });

  final String title;
  final String subtitle;
  final String room;
  final String instructor;
  final Color color;
  final void Function(String value)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.textstyle18.copyWith(color: Colors.black),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (onPressed != null) {
                      onPressed!(value);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'edit', child: Text("Edit")),
                    const PopupMenuItem(value: 'delete', child: Text("Delete")),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyles.textstyle14.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, size: 14.sp),
                const SizedBox(width: 4),
                Text(
                  room,
                  style: TextStyles.textstyle12.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                CircleAvatar(radius: 8.sp),
                const SizedBox(width: 6),
                Text(
                  instructor,
                  style: TextStyles.textstyle12.copyWith(color: Colors.black),
                ),
                const Spacer(),
                Icon(Icons.notifications_none, size: 16.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
