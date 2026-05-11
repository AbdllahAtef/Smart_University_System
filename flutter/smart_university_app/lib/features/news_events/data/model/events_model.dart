import 'package:smart_university_app/core/utils/random.dart';

class EventModel {
  final String title;
  final String description;
  final String eventDate;
  final String image;

  EventModel({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.image,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'],
      description: json['description'],
      eventDate: json['eventDate'],
      image: getRandomImage(),
    );
  }
}


