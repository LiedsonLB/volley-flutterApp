import 'package:flutter/material.dart';

class TimerLayout extends StatelessWidget {
  final String time;

  const TimerLayout({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  // chama a variavel time na string interpolada para exibir o tempo na tela
                  'Tempo de Jogo: $time',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
