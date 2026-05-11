import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    initialDate: DateTime.now(),
  );
}
