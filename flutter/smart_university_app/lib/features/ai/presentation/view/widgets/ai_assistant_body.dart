import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/ai/presentation/helpers/scroll_to_bottom_func.dart';
import 'package:smart_university_app/features/ai/presentation/manager/ai_chat_provider.dart';
import 'package:smart_university_app/features/ai/presentation/view/widgets/chat_bubble.dart';
import 'package:smart_university_app/features/ai/presentation/view/widgets/chat_input_field.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';

class AiAssistantBody extends ConsumerStatefulWidget {
  const AiAssistantBody({super.key});

  @override
  ConsumerState<AiAssistantBody> createState() => _AiAssistantBodyState();
}

class _AiAssistantBodyState extends ConsumerState<AiAssistantBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);

    return Column(
      children: [
        const CourseHeader(title: 'Ai Assistant'),
        Expanded(
          child: messages.isEmpty
              ? Center(
                  child: Text(
                    "How can I help you today?",
                    style: TextStyles.textstyle16.copyWith(
                      color: const Color(0Xff8B2072),
                    ),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: messages.length,
                  itemBuilder: (context, index) =>
                      ChatBubble(message: messages[index]),
                ),
        ),
        ChatInputField(
          controller: _controller,
          onSend: () {
            if (_controller.text.trim().isNotEmpty) {
              ref
                  .read(chatProvider.notifier)
                  .sendMessage(_controller.text.trim());
              _controller.clear();
              scrollToBottom(_scrollController);
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
