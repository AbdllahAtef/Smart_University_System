import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/date_item.dart';

class DateListView extends ConsumerStatefulWidget {
  const DateListView({super.key});

  @override
  ConsumerState<DateListView> createState() => _DateListViewState();
}

class _DateListViewState extends ConsumerState<DateListView> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dates = ref.read(datesProvider);
      final today = DateTime.now();

      final index = dates.indexWhere((d) => isSameDay(d, today));

      if (index != -1) {
        _controller.animateTo(
          index * 70,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);
    final dates = ref.watch(datesProvider);

    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = isSameDay(date, selectedDate);

          return DateItem(
            date: date,
            isSelected: isSelected,
            onTap: () {
              ref.read(selectedDateProvider.notifier).state = date;
            },
          );
        },
      ),
    );
  }
}


