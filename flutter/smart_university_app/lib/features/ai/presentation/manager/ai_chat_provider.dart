import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/ai/data/model/chat_message_model.dart';
import 'package:smart_university_app/features/ai/data/services/ai_analysis_services.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, List<ChatMessage>>((
  ref,
) {
  return ChatNotifier(AiAnalysisService());
});

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  final AiAnalysisService _chatService;

  ChatNotifier(this._chatService) : super([]);

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }

    final userMessage = ChatMessage(role: "user", content: text);

    state = [...state, userMessage];

    try {
      final response = await _chatService.getChatResponse(text);

      final botMessage = ChatMessage(role: "assistant", content: response);

      state = [...state, botMessage];
    } catch (e) {
      final errorMessage = ChatMessage(
        role: "assistant",
        content: "Something went wrong",
      );

      state = [...state, errorMessage];
    }
  }

  void clearChat() {
    state = [];
  }
}

