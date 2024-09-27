import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/main.dart';

class ActionButtonLeft extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const ActionButtonLeft({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                AppColors.colorDarkBlue,
              ),
              foregroundColor: WidgetStateProperty.all<Color>(
                Colors.white,
              ),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 35.0,
                height: 1.1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Text(name,
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
