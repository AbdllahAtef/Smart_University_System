class SubmitGradeModel {
  final int studentId;
  final int courseId;
  final int grade;
  final String type; 

  SubmitGradeModel({
    required this.studentId,
    required this.courseId,
    required this.grade,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    if (type == "Midterm") {
      return {"studentId": studentId, "courseId": courseId, "midterm": grade};
    } else {
      return {"studentId": studentId, "courseId": courseId, "final": grade};
    }
  }

  String get endpoint {
    return type == "Midterm" ? "/api/grades/midterm" : "/api/grades/final";
  }
}
