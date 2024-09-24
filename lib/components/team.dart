import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  final String name;
  final int players;

  const Team({
    super.key,
    required this.name,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontFamily: 'ConcertOne',
              fontSize: 24.0,
              height: 1.2,
              color: Colors.yellow,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$players',
              style: const TextStyle(
                fontFamily: 'ConcertOne',
                fontSize: 46.0,
                height: 0.9,
                color: Color.fromARGB(255, 6, 40, 104),
              ),
            ),
            const SizedBox(width: 5.0),
            const RotatedBox(
              quarterTurns: 3,
              child: Text(
                'jogadores',
                style: TextStyle(
                  fontFamily: 'ConcertOne',
                  fontSize: 7.5,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
