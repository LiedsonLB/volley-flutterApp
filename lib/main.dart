import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojeto_3/components/floating_button.dart';
import 'package:flutterprojeto_3/components/header.dart';
import 'package:flutterprojeto_3/components/modals/modal_add_teams.dart';
import 'package:flutterprojeto_3/components/start_game.dart';
import 'package:flutterprojeto_3/components/team_details.dart';
import 'package:flutterprojeto_3/api/teams_data.dart';
import 'package:flutterprojeto_3/pages/scoreboard_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class AppColors {
  static const Color colorBlue = Color(0xFF00ADC3);
  static const Color colorDarkBlue = Color(0xFF2B4A8E);
  static const Color colorLightRed = Color(0xFFF77859);
  static const Color colorWhite = Color(0xFFC2F2F8);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoVolley Scoreboard',
      theme: ThemeData(
        primaryColor: AppColors.colorBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorBlue),
        fontFamily: "ConcertOne",
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'NeoVolley Scoreboard'),
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

  void _startGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HorizontalPage()),
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
            StartGame(onPressed: _startGame),
          ],
        ),
      ),
      floatingActionButton: AddTeamButton(onPressed: _showAddTeamModal),
    );
  }
}
