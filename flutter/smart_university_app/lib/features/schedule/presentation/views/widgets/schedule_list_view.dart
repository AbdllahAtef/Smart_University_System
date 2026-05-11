import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/core/utils/random.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/lecture_item.dart';

class ScheduleListView extends ConsumerWidget {
  const ScheduleListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lecturesAsync = ref.watch(filteredLecturesProvider);
    return lecturesAsync.when(
      data: (lectures) {
        if (lectures.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.free_breakfast, size: 50.sp, color: Colors.grey),
                const SizedBox(height: 10),
                const Text("No lectures today 😴"),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref.refresh(allLecturesProvider.future),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: lectures.length,
            itemBuilder: (context, index) {
              final lecture = lectures[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: LectureItem(
                  startTime: formatTime(lecture.startTime),
                  endTime: formatTime(lecture.endTime),
                  title: lecture.title,
                  subtitle: lecture.subtitle,
                  room: lecture.room,
                  instructor: lecture.instructor,
                  color: getNiceRandomColor(),
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}


