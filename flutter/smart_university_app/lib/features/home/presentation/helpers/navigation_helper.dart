import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/home/presentation/manager/home_view_provider.dart';

void openSchedule(WidgetRef ref) {
  ref.read(bottomNavProvider.notifier).state = 2;
}
