class QuizState {
  final int currentIndex;
  final Map<int, int> answers;
  final bool isSubmitting;
  final String? error;

  QuizState({
    this.currentIndex = 0,
    this.answers = const {},
    this.isSubmitting = false,
    this.error,
  });

  QuizState copyWith({
    int? currentIndex,
    Map<int, int>? answers,
    bool? isSubmitting,
    String? error,
    bool clearError = false,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: clearError ? null : error ?? this.error,
    );
  }
}
