import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/ai/data/model/chat_message_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == "user";

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),

        padding: EdgeInsets.all(12.h),

        constraints: BoxConstraints(maxWidth: 0.75.sw),

        decoration: BoxDecoration(
          color: isUser
              ? const Color(0xFF8B2072)
              : const Color.fromARGB(255, 83, 69, 240),

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),

            topRight: Radius.circular(15.r),

            bottomLeft: Radius.circular(isUser ? 15.r : 0),

            bottomRight: Radius.circular(isUser ? 0 : 15.r),
          ),
        ),

        child: Text(
          message.content,

          style: TextStyles.textstyle14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}


