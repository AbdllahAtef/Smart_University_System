import 'package:flutter/material.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "Create Account",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B2072),
            ),
          ),
        ),
      ],
    );
  }
}
