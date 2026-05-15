import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/features/news_events/data/model/news_model.dart';
import 'package:smart_university_app/features/news_events/data/services/news_services.dart';

final newsServiceProvider = Provider((ref) {
  return NewsService();
});

final newsProvider = FutureProvider<List<NewsModel>>((ref) async {
  final token = ref.watch(tokenProvider);
  if (token == null) return [];

  final service = ref.read(newsServiceProvider);
  return service.getNews();
});


