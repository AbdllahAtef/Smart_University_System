import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/onboarding/presentation/manager/on_boarding_provider.dart';
import 'package:smart_university_app/features/onboarding/presentation/view/widgets/on_boarding_body.dart';
import 'package:smart_university_app/features/onboarding/presentation/view/widgets/on_boarding_bottom_sheet.dart';
import 'package:smart_university_app/features/onboarding/presentation/view/widgets/on_boarding_indicator.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(onBoardingListProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const OnBoardingIndicator(),
            OnBoardingBody(controller: controller, list: list),
          ],
        ),
      ),
      bottomSheet: OnBoardingBottomSheet(controller: controller, list: list),
    );
  }
}
