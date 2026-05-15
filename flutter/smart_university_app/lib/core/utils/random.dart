import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_university_app/core/assets/app_assets.dart';

final List<String> eventImages = [
  AppAssets.event1,
  AppAssets.event2,
  AppAssets.event3,
];

String getRandomImage() {
  final random = Random();
  return eventImages[random.nextInt(eventImages.length)];
}

Color getNiceRandomColor() {
  final random = Random();

  return HSVColor.fromAHSV(
    1.0,
    random.nextDouble() * 360,
    0.2 + random.nextDouble() * 0.3,
    0.85 + random.nextDouble() * 0.1,
  ).toColor();
}


