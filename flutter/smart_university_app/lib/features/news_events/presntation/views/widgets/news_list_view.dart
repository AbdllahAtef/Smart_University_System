import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/news_events/presntation/manager/news_provider.dart';
import 'package:smart_university_app/features/news_events/presntation/views/widgets/news_card.dart';

class NewsListView extends ConsumerWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);

    return newsAsync.when(
      data: (newsList) {
        if (newsList.isEmpty) {
          return const Center(child: Text("No news yet"));
        }

        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsCard(news: newsList[index]);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}

