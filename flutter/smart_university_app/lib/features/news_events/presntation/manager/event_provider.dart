import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/features/news_events/data/model/events_model.dart';
import 'package:smart_university_app/features/news_events/data/services/event_services.dart';


final eventServiceProvider = Provider((ref) {
  return EventService();
});

final eventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final token = ref.watch(tokenProvider);
  if (token == null) return [];

  final service = ref.read(eventServiceProvider);
  return service.getEvents();
});


