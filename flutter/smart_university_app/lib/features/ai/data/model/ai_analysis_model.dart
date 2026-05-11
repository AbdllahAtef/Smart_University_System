class AiAnalysisModel {
  final String name;
  final double academicScore;
  final String riskLevel;
  final String failProbability;

  AiAnalysisModel({
    required this.name,
    required this.academicScore,
    required this.riskLevel,
    required this.failProbability,
  });

  factory AiAnalysisModel.fromJson(Map<String, dynamic> json) {
    return AiAnalysisModel(
      name: json['name']?.toString() ?? '',

      academicScore: (json['academic_Score'] as num?)?.toDouble() ?? 0,

      riskLevel: json['risk_Level'].toString(),

      failProbability: json['fail_Probability']?.toString() ?? '',
    );
  }
}
