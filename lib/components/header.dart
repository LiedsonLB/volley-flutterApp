import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 42,
            image: Image.asset('lib/img/ball.png').image,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Volley',
                style: TextStyle(
                  fontSize: 40,
                  height: 0.8,
                  fontFamily: 'ConcertOne',
                  color: Colors.grey[50],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  'do fim de semana',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'ConcertOne',
                    color: Colors.grey[50],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}