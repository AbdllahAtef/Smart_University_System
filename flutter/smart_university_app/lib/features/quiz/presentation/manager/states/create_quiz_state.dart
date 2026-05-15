class CreateQuizState {
  final bool isLoading;
  final String? error;

  const CreateQuizState({this.isLoading = false, this.error});

  CreateQuizState copyWith({bool? isLoading, String? error}) {
    return CreateQuizState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
