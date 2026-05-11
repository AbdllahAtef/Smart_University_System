import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key, required this.provider, this.hint = "Search"});

  final StateProvider<String> provider;
  final String hint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: TextField(
        onChanged: (value) {
          ref.read(provider.notifier).state = value;
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyles.textstyle16.copyWith(
            color: Colors.grey.shade400,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: 25.sp,
          ),
          border: searchBorder(),
          enabledBorder: searchBorder(),
          focusedBorder: searchBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder searchBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0XFFCBCBCB), width: 1),
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}


