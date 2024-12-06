import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/components/team_card_name.dart';
import 'package:flutterprojeto_3/api/teams_data.dart';

class TeamDetails extends StatelessWidget {
  final List<TeamData> teams;

  const TeamDetails({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              width: 40.0 * 5,
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'TIMES',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'ConcertOne',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              // Area já configurada para lidar com textos grandes e com grande numero de times
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: teams
                    .map((team) => Team(name: team.name, players: team.players))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
