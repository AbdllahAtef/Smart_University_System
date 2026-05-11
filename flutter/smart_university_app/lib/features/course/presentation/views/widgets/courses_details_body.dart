import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/assignment_provider.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/course/presentation/helper/course_navigation.dart';
import 'package:smart_university_app/features/course/presentation/manager/courses_provider.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_content_section.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_details_card.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/custom_tabs.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/tasks_header.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/lecture_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';

class CoursesDetailsBody extends ConsumerWidget {
  const CoursesDetailsBody({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    final tabIndex = ref.watch(tabIndexProvider);
    final safeIndex = tabIndex >= tabs.length ? 0 : tabIndex;
    final assignmentsAsync = ref.watch(assignmentsProvider(course.id));
    final quizzesAsync = ref.watch(quizzesProvider(course.id));
    final attendanceState = ref.watch(attendanceSessionsProvider);
    final lecturesAsync = ref.watch(lecturesByCourseProvider(course.id));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const CourseHeader(title: "Course Details"),
          CourseDetailsCard(
            title: course.name,
            description: course.description,
          ),
          const SizedBox(height: 12),
          const CustomTabs(),
          const SizedBox(height: 12),
          TasksHeader(
            onTab: () {
              if (safeIndex == 3) {
                ref
                    .read(localLecturesProvider.notifier)
                    .addEmptyLecture(course.id);
              } else {
                handleCourseAction(
                  context: context,
                  ref: ref,
                  tabIndex: safeIndex,
                  course: course,
                );
              }
            },

            count: safeIndex == 0
                ? assignmentsAsync.value?.length ?? 0
                : safeIndex == 1
                ? quizzesAsync.value?.length ?? 0
                : safeIndex == 2
                ? attendanceState.sessions.length
                : ((lecturesAsync.value?.length ?? 0) +
                      ref.watch(localLecturesProvider).length),

            canCreate: safeIndex == 3
                ? (((lecturesAsync.value?.length ?? 0) +
                          ref.watch(localLecturesProvider).length) <
                      2)
                : true,
          ),

          const SizedBox(height: 8),

          CourseContentSection(course: course, safeIndex: safeIndex),
        ],
      ),
    );
  }
}
