import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/core/assets/app_assets.dart';
import 'package:smart_university_app/features/onboarding/data/model/on_boarding_model.dart';

final onBoardingListProvider = Provider<List<OnBoardingModel>>((ref) {
  return [
    OnBoardingModel(
      image: AppAssets.onboarding1,
      title: 'Better way to learning\nis calling you!',
      description: 'Unlock Your Potential, Embrace Education',
    ),
    OnBoardingModel(
      image: AppAssets.onboarding2,
      title: 'Find yourself by doing\nwhatever you do!',
      description: 'Education with Grace and Style',
    ),
    OnBoardingModel(
      image: AppAssets.onboarding2,
      title: 'it’s not just learning,\nit’s a promise!',
      description: 'Learn Today, Lead Tomorrow',
    ),
  ];
});

class OnBoardingNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setPage(int index) {
    state = index;
  }
}

final onBoardingProvider = NotifierProvider<OnBoardingNotifier, int>(
  OnBoardingNotifier.new,
);


