import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonLayout({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Jogo Casado',
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey[50],
            fontFamily: 'ConcertOne',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
            ),
            onPressed: onPressed,
            child: const Text(
              'Iniciar',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'ConcertOne',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
