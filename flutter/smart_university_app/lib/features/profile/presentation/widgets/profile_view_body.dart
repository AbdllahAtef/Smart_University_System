import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/ai/presentation/manager/ai_provider.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/dash_board.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/doctor_quote_card.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/profile_statistics_card.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/profile_stats_card.dart';
import 'package:smart_university_app/features/profile/presentation/manager/user_provider.dart';

class ProfileViewBody extends ConsumerWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final analysisAsync = ref.watch(aiAnalysisProvider);
    final role = ref.watch(userRoleProvider);

    return userAsync.when(
      data: (user) {
        if (user == null) {
          return const Center(child: Text("No user data"));
        }
        final isDoctor = role == "doctor";
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ProfileHeader(
                name: user.fullName,
                studentId: user.id.toString(),
                avatarPath: '',
              ),
              SizedBox(height: 24.h),
              ProfileCard(
                email: user.email,
                id: user.nationalId,
                faculty: user.facultyName,
              ),
              SizedBox(height: 24.h),
              isDoctor
                  ? const DoctorQuoteCard()
                  : analysisAsync.when(
                      data: (analysis) {
                        if (analysis == null) {
                          return const Text("No analysis yet");
                        }
                        return ProfileStatisticsCard(
                          date: "Today",
                          failProbability: analysis.failProbability,
                          riskLevel: analysis.riskLevel,
                          onMarkAttend: () {},
                          acadimicscore: analysis.academicScore,
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (e, _) => Text(e.toString()),
                    ),
              SizedBox(height: 24.h),
              const DashBoard(),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }
}
