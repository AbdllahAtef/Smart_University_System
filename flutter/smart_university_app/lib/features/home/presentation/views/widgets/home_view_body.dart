import 'package:flutter/material.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/custom_tab_item.dart';
import 'package:smart_university_app/features/home/presentation/views/widgets/subject_list_view.dart';
import 'package:smart_university_app/features/home/presentation/views/widgets/todays_classes.dart';
import 'package:smart_university_app/features/news_events/presntation/views/widgets/news_events_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubjectListView(),
        const TodaysClasses(),
        const Row(
          children: [
            CustomTabItem(text: "News", index: 0),
            SizedBox(width: 20),
            CustomTabItem(text: "Events", index: 1),
          ],
        ),
        Expanded(
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            child: const NewsEventsList(),
          ),
        ),
      ],
    );
  }
}

