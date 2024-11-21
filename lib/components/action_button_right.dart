import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/main.dart';

class ActionButtonRight extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const ActionButtonRight({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(name,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              )),
          const SizedBox(width: 15.0),
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
                fontSize: 25.0,
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
