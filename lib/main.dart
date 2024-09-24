import 'package:flutter/material.dart';
import 'package:flutterprojeto_3/components/floating_button.dart';
import 'package:flutterprojeto_3/components/header.dart';
import 'package:flutterprojeto_3/components/modals/modal_add_teams.dart';
import 'package:flutterprojeto_3/components/start_game.dart';
import 'package:flutterprojeto_3/components/team_details.dart';
import 'package:flutterprojeto_3/api/teams_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoVolley',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'NeoVolley'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showAddTeamModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ModalAddTeams(
          onAddTeam: (name, players) {
            setState(() {
              teams.add(TeamData(name: name, players: players));
            });
          },
        );
      },
    );
  }

  void _startGame() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Começou o jogo!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Aqui seria a tela para começar as informações entre os times.'),
                Text(
                    'Mas como estava com preguiça de fazer, deixarei para depois, então só coloquei um botão para fechar.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Entendi'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
            const SizedBox(height: 50.0),
            StartGame(onPressed: _startGame),
          ],
        ),
      ),
      floatingActionButton: AddTeamButton(onPressed: _showAddTeamModal),
    );
  }
}
