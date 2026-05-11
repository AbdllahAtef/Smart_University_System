import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/ai/data/model/chat_message_model.dart';
import 'package:smart_university_app/features/ai/presentation/view/widgets/chat_bubble.dart';

class ChatMessagesList extends StatelessWidget {
  final List<ChatMessage> messages;
  final ScrollController controller;

  const ChatMessagesList({
    super.key,
    required this.messages,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: messages.length,
      itemBuilder: (context, index) => ChatBubble(message: messages[index]),
    );
  }
}
