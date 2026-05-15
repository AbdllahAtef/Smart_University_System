import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/onboarding/data/model/on_boarding_model.dart';
import 'package:smart_university_app/features/onboarding/presentation/manager/on_boarding_provider.dart';
import 'package:smart_university_app/features/onboarding/presentation/view/widgets/on_boarding_page_item.dart';

class OnBoardingBody extends ConsumerWidget {
  const OnBoardingBody({
    super.key,
    required this.controller,
    required this.list,
  });

  final PageController controller;
  final List<OnBoardingModel> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        onPageChanged: (index) {
          ref.read(onBoardingProvider.notifier).setPage(index);
        },
        itemBuilder: (context, index) {
          final item = list[index];
          return OnBoardingPageItem(item: item);
        },
      ),
    );
  }
}
