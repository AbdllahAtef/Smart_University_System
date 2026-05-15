import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class TasksHeader extends ConsumerWidget {
  final int count;

  final bool canCreate;

  final VoidCallback? onTab;

  const TasksHeader({
    super.key,

    required this.count,

    required this.canCreate,

    this.onTab,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          "Current Tasks",

          style: TextStyles.textstyle16.copyWith(
            color: Colors.black,

            fontWeight: FontWeight.w600,
          ),
        ),

        Row(
          children: [
            if (role == "doctor" && onTab != null)
              GestureDetector(
                onTap: canCreate ? onTab : null,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                    color: canCreate ? const Color(0xFF8B2072) : Colors.grey,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, size: 16, color: Colors.white),
                      SizedBox(width: 4.w),
                      Text(
                        "Create",
                        style: TextStyles.textstyle12.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),

              decoration: BoxDecoration(
                color: const Color(0xFF8B2072).withOpacity(0.1),

                borderRadius: BorderRadius.circular(20.r),
              ),

              child: Text(
                "$count IN PROGRESS",

                style: TextStyles.textstyle12.copyWith(
                  color: const Color(0xFF8B2072),

                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
