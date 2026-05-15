import 'package:smart_university_app/features/course/data/model/courses_model.dart';

class GradesModel {
  final int id;
  final int studentId;
  final int courseId;
  final int midtermGrade;
  final int finalGrade;
  final bool isPublished;

  GradesModel({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.midtermGrade,
    required this.finalGrade,
    required this.isPublished,
  });

  factory GradesModel.fromJson(Map<String, dynamic> json) {
    return GradesModel(
      id: json['id'],
      studentId: json['studentId'],
      courseId: json['courseId'],
      midtermGrade: json['midtermGrade'],
      finalGrade: json['finalGrade'],
      isPublished: json['isPublished'],
    );
  }
}

class GradeWithCourse {
  final GradeResponseModel grade;
  final CourseModel course;

  GradeWithCourse({required this.grade, required this.course});
}
class GradeResponseModel {
  final int midterm;
  final int finalGrade;
  final int maxMidterm;
  final int maxFinal;
  final int total;

  GradeResponseModel({
    required this.midterm,
    required this.finalGrade,
    required this.maxMidterm,
    required this.maxFinal,
    required this.total,
  });

  factory GradeResponseModel.fromJson(Map<String, dynamic> json) {
    return GradeResponseModel(
      midterm: json['midterm'] ?? 0,
      finalGrade: json['final'] ?? 0,
      maxMidterm: json['maxMidterm'] ?? 0,
      maxFinal: json['maxFinal'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

