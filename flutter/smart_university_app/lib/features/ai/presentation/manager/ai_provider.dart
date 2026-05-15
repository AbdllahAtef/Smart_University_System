import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/ai/data/model/ai_analysis_model.dart';
import 'package:smart_university_app/features/ai/data/services/ai_analysis_services.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';

final aiAnalysisServiceProvider = Provider((ref) => AiAnalysisService());

final aiAnalysisProvider = FutureProvider<AiAnalysisModel?>((ref) async {
  final service = ref.read(aiAnalysisServiceProvider);

  ref.watch(userIdProvider);

  return service.getAnalysis();
});
