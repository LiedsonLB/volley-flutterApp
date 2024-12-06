import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/main.dart';

class ActionButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final bool isLeft;  // Parâmetro para controlar o alinhamento (esquerda ou direita)

  const ActionButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.isLeft = true,  // Define o padrão como 'esquerda'
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: isLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (isLeft) ...[
            Text(
              name,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15.0),
          ],
          InkWell (
            borderRadius: BorderRadius.circular(100.0),
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.colorDeepBlue,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: const Text(
                '+',
                style: TextStyle(
                  color: AppColors.colorWhite,
                  fontSize: 30.0,
                  height: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (!isLeft) ...[  // Quando 'isLeft' for false, o texto aparece depois do botão.
            const SizedBox(width: 15.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}