import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorQuoteCard extends StatelessWidget {
  const DoctorQuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          colors: [
            Color(0xff4F46E5),
            Color(0xff7C3AED),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 28.sp,
          ),

          SizedBox(height: 16.h),

          Text(
            "Daily Inspiration",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 12.h),

          Text(
            "“Education is the most powerful weapon which you can use to change the world.”",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "- Nelson Mandela",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}