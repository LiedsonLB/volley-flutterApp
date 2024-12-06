import 'package:flutter/material.dart';

class PointsLayout extends StatelessWidget {
  final int team1Points;
  final int team2Points;

  const PointsLayout({super.key, required this.team1Points, required this.team2Points});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: team1Points > team2Points,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Image.asset(
                          'lib/img/ball.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        team1Points.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: team2Points > team1Points,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Image.asset(
                          'lib/img/ball.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        team2Points.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
