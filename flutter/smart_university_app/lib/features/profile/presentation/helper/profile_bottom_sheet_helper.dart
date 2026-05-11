import 'package:flutter/material.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/settings.dart';

void openSettingsSheet(BuildContext context) {
  showModalBottomSheet(context: context, builder: (_) => const Settings());
}
