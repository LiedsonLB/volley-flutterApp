import 'package:flutter/material.dart';

import 'package:flutterprojeto_3/components/button_floating.dart';
import 'package:flutterprojeto_3/components/header.dart';
import 'package:flutterprojeto_3/components/modals/modal_add_teams.dart';
import 'package:flutterprojeto_3/components/button_layout.dart';
import 'package:flutterprojeto_3/components/modals/modal_select_teams.dart';
import 'package:flutterprojeto_3/components/team_list.dart';
import 'package:flutterprojeto_3/api/teams_data.dart';
import 'package:flutterprojeto_3/pages/scoreboard_page/game_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String team1;
  late String team2;

  void _showAddTeamModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: ModalAddTeams(
                onAddTeam: (name, players) {
                  setState(() {
                    teams.add(TeamData(name: name, players: players));
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSelectTeamsModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ModalSelectTeams(
          onTeamsSelected: (selectedTeam1, selectedTeam2) {
            setState(
              () {
                team1 = selectedTeam1;
                team2 = selectedTeam2;
              },
            );
          },
          startGame: _startGame,
        );
      },
    );
  }

  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GamePage(team1: team1, team2: team2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Header(),
            const SizedBox(height: 50.0),
            TeamDetails(teams: teams),
            const SizedBox(height: 70.0),
            Column(
              children: [
                Text(
                  'Jogo Casado',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[50],
                    fontFamily: 'ConcertOne',
                  ),
                ),
                ButtonLayout(
                  onPressed: _showSelectTeamsModal,
                  text: 'Selecionar Times',
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: AddTeamButton(onPressed: _showAddTeamModal),
    );
  }
}
