class CreateAssignmentState {
  final bool isLoading;

  final bool isSuccess;

  final String? error;

  const CreateAssignmentState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  CreateAssignmentState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return CreateAssignmentState(
      isLoading: isLoading ?? this.isLoading,

      isSuccess: isSuccess ?? this.isSuccess,

      error: error,
    );
  }
}
