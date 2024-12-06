import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/main.dart';

class ButtonOverAll extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonOverAll({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
                style: BorderStyle.solid,
              ),
              backgroundColor: AppColors.colorDeepBlue,
              foregroundColor: AppColors.colorWhite,
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            ),
            onPressed: onPressed,
            child: const Text(
              'Placar Geral',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'ConcertOne',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
