import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class CourseListItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Widget? trailing;

  const CourseListItem({
    super.key,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: TextStyles.textstyle16.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: trailing == null
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : EdgeInsets.zero,
                child:
                    trailing ??
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


