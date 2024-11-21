import 'package:flutter/material.dart';

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
              backgroundColor: const Color.fromARGB(255, 6, 40, 104),
              foregroundColor: Colors.grey[50],
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
