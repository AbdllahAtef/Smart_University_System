import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/core/widgets/custom_list_tile.dart';
import 'package:smart_university_app/features/profile/presentation/helper/logout_helper.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomListTile(
            icon: Icons.dark_mode,
            title: "Dark Mode",
            onTap: () {},
            iconColor: Colors.black,
          ),
          CustomListTile(
            icon: Icons.language,
            title: "Language",
            onTap: () {},
            iconColor: Colors.blueAccent,
          ),
          CustomListTile(
            icon: Icons.logout,
            title: "Logout",
            iconColor: Colors.red,
            onTap: () {
             logoutUser(context: context, ref: ref);
            },
          ),
        ],
      ),
    );
  }
}



