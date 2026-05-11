import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/assignment/data/model/create_assignment_model.dart';
import 'package:smart_university_app/features/assignment/data/services/assignment_services.dart';
import 'package:smart_university_app/features/assignment/data/services/assignment_submission_service.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/states/create_assignment_state.dart';

final assignmentServiceProvider = Provider((ref) {
  return AssignmentService();
});

final assignmentsProvider = FutureProvider.family<List<AssignmentModel>, int>((
  ref,
  courseId,
) async {
  final service = ref.read(assignmentServiceProvider);

  return service.getAssignments(courseId);
});
final createAssignmentProvider =
    StateNotifierProvider<CreateAssignmentNotifier, CreateAssignmentState>((
      ref,
    ) {
      return CreateAssignmentNotifier(ref);
    });

class CreateAssignmentNotifier extends StateNotifier<CreateAssignmentState> {
  final Ref ref;

  CreateAssignmentNotifier(this.ref) : super(const CreateAssignmentState());

  Future<void> create({
    required String title,
    required String description,
    required DateTime dueDate,
    required int maxGrade,
    required int courseId,
  }) async {
    state = state.copyWith(isLoading: true, isSuccess: false, error: null);

    try {
      final service = ref.read(assignmentServiceProvider);

      final model = CreateAssignmentModel(
        title: title,
        description: description,
        dueDate: dueDate.toIso8601String(),
        maxGrade: maxGrade,
        courseId: courseId,
      );

      await service.createAssignment(model);

      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        error: e.toString(),
      );
    }
  }
}

final assignmentSubmissionServiceProvider = Provider((ref) {
  return AssignmentSubmissionService();
});

final isPickingFileProvider = StateProvider<bool>((ref) {
  return false;
});

final fileProvider = StateProvider<PlatformFile?>((ref) {
  return null;
});
