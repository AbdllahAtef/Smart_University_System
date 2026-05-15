import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class SessionCard extends ConsumerWidget {
  const SessionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lecturesAsync = ref.watch(filteredLecturesProvider);

    return lecturesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
      data: (lectures) {
        if (lectures.isEmpty) {
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text("No lectures today 😴"),
            ),
          );
        }
        final lecture = lectures.first;
        return Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lecture.title,
                  style: TextStyles.textstyle14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.schedule, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      "${formatTime(lecture.startTime)} - ${formatTime(lecture.endTime)}",
                      style: TextStyles.textstyle8.copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: 16.w),
                    Icon(
                      Icons.location_on_outlined,
                      size: 16.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      lecture.room,
                      style: TextStyles.textstyle8.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  lecture.instructor ,
                  style: TextStyles.textstyle8.copyWith(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



