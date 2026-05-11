import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/home/presentation/manager/home_view_provider.dart';
import 'package:smart_university_app/features/news_events/presntation/views/widgets/event_list_view.dart';
import 'package:smart_university_app/features/news_events/presntation/views/widgets/news_list_view.dart';

class NewsEventsList extends ConsumerWidget {
  const NewsEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(tabProvider);
    return selectedTab == 0 ? const NewsListView() : const EventListView();
  }
}
