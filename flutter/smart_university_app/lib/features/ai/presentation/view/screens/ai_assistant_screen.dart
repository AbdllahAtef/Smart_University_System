import 'package:flutter/material.dart';
import 'package:smart_university_app/features/ai/presentation/view/widgets/ai_assistant_body.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AiAssistantBody()));
  }
}
