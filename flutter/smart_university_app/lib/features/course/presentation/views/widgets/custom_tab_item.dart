import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/home/presentation/manager/home_view_provider.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class CustomTabItem extends ConsumerWidget {
  const CustomTabItem({super.key, required this.text, required this.index});

  final String text;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabProvider);
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          ref.read(tabProvider.notifier).state = index;
        },
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyles.textstyle18.copyWith(
                  color: isSelected ? const Color(0XFF8B2072) : Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0XFF8B2072)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


