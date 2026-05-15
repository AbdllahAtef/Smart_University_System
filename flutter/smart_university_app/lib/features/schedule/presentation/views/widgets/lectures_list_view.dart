import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/schedule/presentation/helpers/lecture_helper.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/lecture_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/add_lecture_view.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/lecture_card.dart';

class LecturesListView extends ConsumerWidget {
  const LecturesListView({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lectures = ref.watch(combinedLecturesProvider(course.id));

    if (lectures.isEmpty) {
      return const Center(child: Text("No lectures found"));
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: lectures.length,
      itemBuilder: (context, index) {
        final lecture = lectures[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: LectureCard(
            title: lecture.title.isEmpty ? "Empty Lecture" : lecture.title,
            subtitle: lecture.subtitle,
            room: lecture.room,
            instructor: lecture.instructor,
            color: Colors.purple,
            onPressed: (value) async {
              if (value == 'edit') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AddLectureView(course: course, lecture: lecture),
                  ),
                );
              }

              if (value == 'delete') {
                try {
                  await ScheduleHelper.deleteLecture(
                    ref: ref,
                    lecture: lecture,
                    courseId: course.id,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Lecture Deleted")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              }
            },
          ),
        );
      },
    );
  }
}
