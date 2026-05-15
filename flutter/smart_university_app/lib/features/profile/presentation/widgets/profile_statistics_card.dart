import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/attendence_button.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/state_tile.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/statistics_row.dart';

class ProfileStatisticsCard extends StatelessWidget {
  final String date;

  final double acadimicscore;

  final String riskLevel;

  final String failProbability;

  final VoidCallback onMarkAttend;

  const ProfileStatisticsCard({
    super.key,
    required this.date,
    required this.riskLevel,
    required this.onMarkAttend,
    required this.acadimicscore,
    required this.failProbability,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3FF),
        border: BoxBorder.all(color: const Color(0xFF8B2072), width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: TextStyles.textstyle18.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    date,
                    style: TextStyles.textstyle12.copyWith(color: Colors.grey),
                  ),
                ],
              ),

              AttendenceButton(onMarkAttend: onMarkAttend),
            ],
          ),

          SizedBox(height: 16.h),

          StatisticsRow(
            children: [
              Expanded(
                child: StateTile(
                  icon: Icons.calendar_month,
                  iconColor: const Color(0xFFFF6B35),
                  label: 'Academic Score',
                  value: '$acadimicscore%',
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: StateTile(
                  icon: Icons.analytics_outlined,
                  iconColor: const Color(0xFF8B5CF6),
                  label: 'Risk Level',
                  value: riskLevel,
                  
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          StatisticsRow(
            children: [
              Expanded(
                child: StateTile(
                  icon: Icons.quiz_outlined,
                  iconColor: const Color(0xFFEC4899),
                  label: 'Fail Probability',
                  value: failProbability,
                ),
              ),

              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
