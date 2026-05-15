import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/date_header.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/date_list_view.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/schedule_list_view.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/time_courses_header.dart';


class Scheduleviewbody extends ConsumerWidget {
  const Scheduleviewbody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider.select((date) => date));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: DateHeader(
            date: selectedDate,
            dayName: getDayName(selectedDate),
            monthYear: formatMonthYear(selectedDate),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(38),
              ),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Column(
              children: [
                const DateListView(),
                const SizedBox(height: 8),

                Divider(
                  color: Colors.grey.withOpacity(0.3),
                  thickness: 1,
                  indent: 24,
                  endIndent: 24,
                ),
                const TimeCoursesHeader(),
                const Expanded(child: ScheduleListView()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


