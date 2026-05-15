import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/core/widgets/custom_list_tile.dart';
import 'package:smart_university_app/features/ai/presentation/view/screens/ai_assistant_screen.dart';
import 'package:smart_university_app/features/profile/presentation/helper/profile_bottom_sheet_helper.dart';


class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3FF),
        border: BoxBorder.all(color: const Color(0xFF8B2072), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Dashboard",
              style: TextStyles.textstyle16.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            icon: Icons.settings,
            title: "Setting",
            iconColor: Colors.blue,
            onTap: () {
              openSettingsSheet(context);
            },
          ),
          CustomListTile(
            icon: Icons.smart_toy,
            title: "Your AI Assistant",
            iconColor: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AiAssistantScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


