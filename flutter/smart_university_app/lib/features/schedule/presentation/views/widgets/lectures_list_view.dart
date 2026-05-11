import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/lecture_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/add_lecture_view.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/lecture_card.dart';

class LecturesListView extends ConsumerWidget {
  const LecturesListView({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lecturesAsync = ref.watch(lecturesByCourseProvider(course.id));

    final localLectures = ref.watch(localLecturesProvider);

    return lecturesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (e, _) => Center(child: Text(e.toString())),

      data: (lectures) {
        final allLectures = [...lectures, ...localLectures];

        if (allLectures.isEmpty) {
          return const Center(child: Text("No lectures found"));
        }

        return ListView.builder(
          itemCount: allLectures.length,

          padding: EdgeInsets.zero,

          itemBuilder: (context, index) {
            final lecture = allLectures[index];

            final isEmpty = lecture.id == null;

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
                        builder: (_) => AddLectureView(
                          course: course,

                          lecture: lecture
                        ),
                      ),
                    );
                  }

                  if (value == 'delete') {
                    try {
                      if (isEmpty) {
                        ref
                            .read(localLecturesProvider.notifier)
                            .removeLecture(lecture);
                      } else {
                        await ref
                            .read(scheduleServiceProvider)
                            .deleteLecture(lecture.id!);

                        ref.invalidate(lecturesByCourseProvider(course.id));
                      }

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
      },
    );
  }
}
