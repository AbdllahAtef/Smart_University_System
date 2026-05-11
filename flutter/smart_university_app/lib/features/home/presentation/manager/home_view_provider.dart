import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/core/helpers/navigation.dart';
import 'package:smart_university_app/features/home/data/model/navigation_item.dart';

final tabProvider = StateProvider<int>((ref) => 0);
final bottomNavProvider = StateProvider<int>((ref) => 0);
final currentNavigationItemProvider = Provider<NavigationItem>((ref) {
  final currentIndex = ref.watch(bottomNavProvider);

  return navigationItems[currentIndex];
});
