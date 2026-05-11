import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/assignment/data/services/upload_services.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/assignment_provider.dart';


class UploadCard extends ConsumerWidget {
  const UploadCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileProvider);
    final isPicking = ref.watch(isPickingFileProvider);

    return GestureDetector(
      onTap: isPicking ? null : () => pickFile(ref, context),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(vertical: 30.h),
        decoration: BoxDecoration(
          color: const Color(0xffF5F7FA),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.cloud_upload_outlined,
                size: 24.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              file?.name ?? "Drag and drop file here or click to select",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6.h),
            Text(
              "Max file size: 25 MB",
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

