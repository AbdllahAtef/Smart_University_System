import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/schedule/data/model/lecture_model.dart';
import 'package:smart_university_app/features/schedule/presentation/helpers/pick_time_helper.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/lecture_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/add_lecture_form.dart';

class AddLectureView extends ConsumerStatefulWidget {
  const AddLectureView({super.key, required this.course, this.lecture});

  final CourseModel course;
  final LectureModel? lecture;

  @override
  ConsumerState<AddLectureView> createState() => _AddLectureViewState();
}

class _AddLectureViewState extends ConsumerState<AddLectureView> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final instructorController = TextEditingController();
  final roomController = TextEditingController();

  int selectedDay = 1;
  String startTime = "09:00:00";
  String endTime = "10:30:00";

  @override
  void initState() {
    super.initState();

    final lecture = widget.lecture;

    if (lecture != null) {
      titleController.text = lecture.title;
      subtitleController.text = lecture.subtitle;
      instructorController.text = lecture.instructor;
      roomController.text = lecture.room;
      selectedDay = lecture.day;
      startTime = lecture.startTime;
      endTime = lecture.endTime;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    instructorController.dispose();
    roomController.dispose();
    super.dispose();
  }

  void _onSave() {
    final model = LectureModel(
      id: widget.lecture?.id,
      tempId: widget.lecture?.tempId,
      courseId: widget.course.id,
      title: titleController.text,
      subtitle: subtitleController.text,
      room: roomController.text,
      instructor: instructorController.text,
      day: selectedDay,
      startTime: startTime,
      endTime: endTime,
    );

    ref
        .read(createLectureProvider.notifier)
        .saveLecture(model: model, oldLecture: widget.lecture);
  }

  Future<void> pickStartTime() async {
    final time = await TimePickerHelper.pickTime(context);

    if (time != null) {
      setState(() {
        startTime = time;
      });
    }
  }

  Future<void> pickEndTime() async {
    final time = await TimePickerHelper.pickTime(context);

    if (time != null) {
      setState(() {
        endTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createLectureProvider);
    final isLoading = state is AsyncLoading;

    ref.listen(createLectureProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          if (!context.mounted) return;

          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.lecture == null
                    ? "Lecture Added Successfully"
                    : "Lecture Updated Successfully",
              ),
            ),
          );
        },
        error: (e, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lecture == null ? "Add Lecture" : "Edit Lecture"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AddLectureForm(
          titleController: titleController,
          subtitleController: subtitleController,
          instructorController: instructorController,
          roomController: roomController,
          selectedDay: selectedDay,
          onDayChanged: (value) {
            setState(() {
              selectedDay = value ?? 1;
            });
          },
          startTime: startTime,
          endTime: endTime,
          onPickStartTime: pickStartTime,
          onPickEndTime: pickEndTime,
          onSave: _onSave,
          isLoading: isLoading,
        ),
      ),
    );
  }
}
