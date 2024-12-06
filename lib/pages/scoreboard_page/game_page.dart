import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutterprojeto_3/components/button_action.dart';
import 'package:flutterprojeto_3/pages/overallscore_page/overall_page.dart';
import 'package:flutterprojeto_3/pages/scoreboard_page/components/button_overall.dart';
import 'package:flutterprojeto_3/pages/scoreboard_page/layout/points_layout.dart';
import 'package:flutterprojeto_3/pages/scoreboard_page/layout/teams_indicator.dart';
import 'package:flutterprojeto_3/pages/scoreboard_page/layout/timer_layout.dart';

class GamePage extends StatefulWidget {
  final String team1;
  final String team2;

  const GamePage({super.key, required this.team1, required this.team2});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer _timer;
  int _seconds = 0;
  int _milliseconds = 0;
  String _formattedTime = '0:00"00"';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _startTimer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _milliseconds++;
        if (_milliseconds >= 100) {
          _milliseconds = 0;
          _seconds++;
        }
        _formattedTime =
            _formatTime(_seconds, _milliseconds); // Atualizar o tempo formatado
      });
    });
  }

  // Função para formatar o tempo
  String _formatTime(int seconds, int milliseconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}"${milliseconds.toString().padLeft(2, '0')}';
  }

  void _overAllPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OverAllPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              size: 30.0,
            ),
            tooltip: 'Configurações',
            onPressed: () {
              AlertDialog(
                title: const Text('Configurações'),
                content: const Text('Em breve!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Fechar'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ActionButton(
                        name: 'Ace',
                        onPressed: () {},
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Ataque',
                        onPressed: () {},
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Bloqueio',
                        onPressed: () {},
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Erro',
                        onPressed: () {},
                        isLeft: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Layout de pontos e indicadores de time
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamsIndicator(
                  firstTeam: widget.team1,
                  secondTeam: widget.team2,
                ),
                const PointsLayout(
                  team1Points: 10,
                  team2Points: 20,
                ),
                TimerLayout(time: _formattedTime), // Exibe o tempo formatado
                ButtonOverAll(onPressed: _overAllPage),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionButton(
                        name: 'Ace',
                        onPressed: () {},
                      ),
                      ActionButton(
                        name: 'Ataque',
                        onPressed: () {},
                      ),
                      ActionButton(
                        name: 'Bloqueio',
                        onPressed: () {},
                      ),
                      ActionButton(
                        name: 'Erro',
                        onPressed: () {},
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
