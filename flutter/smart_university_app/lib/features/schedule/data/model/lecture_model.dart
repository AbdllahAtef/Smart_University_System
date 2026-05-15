class LectureModel {
  final int? id;

  final String? tempId;

  final int courseId;

  final String title;

  final String subtitle;

  final String room;

  final String instructor;

  final int day;

  final String startTime;

  final String endTime;

  LectureModel({
    this.id,

    this.tempId,

    required this.courseId,

    required this.title,

    required this.subtitle,

    required this.room,

    required this.instructor,

    required this.day,

    required this.startTime,

    required this.endTime,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      id: json['id'],

      tempId: null,

      courseId: json['courseId'] ?? 0,

      title: json['title'] ?? '',

      subtitle: json['subtitle'] ?? '',

      room: json['room'] ?? '',

      instructor: json['instructor'] ?? '',

      day: json['day'] ?? 0,

      startTime: json['startTime'] ?? '',

      endTime: json['endTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "courseId": courseId,

      "title": title,

      "subtitle": subtitle,

      "room": room,

      "instructor": instructor,

      "day": day,

      "startTime": startTime,

      "endTime": endTime,
    };
  }

  factory LectureModel.empty(int courseId) {
    return LectureModel(
      tempId: DateTime.now().millisecondsSinceEpoch.toString(),

      id: null,

      courseId: courseId,

      title: '',

      subtitle: '',

      room: '',

      instructor: '',

      day: 1,

      startTime: '09:00:00',

      endTime: '10:00:00',
    );
  }
}
