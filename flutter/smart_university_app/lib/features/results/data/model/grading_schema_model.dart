class GradingSchemeModel {
  final int maxMidterm;
  final int maxFinal;

  GradingSchemeModel({required this.maxMidterm, required this.maxFinal});

  Map<String, dynamic> toJson() {
    return {"maxMidterm": maxMidterm, "maxFinal": maxFinal};
  }
}
