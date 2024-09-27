import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojeto_3/components/action_button_left.dart';
import 'package:flutterprojeto_3/components/action_button_right.dart';

class HorizontalPage extends StatefulWidget {
  const HorizontalPage({Key? key}) : super(key: key);

  @override
  _HorizontalPageState createState() => _HorizontalPageState();
}

class _HorizontalPageState extends State<HorizontalPage> {
  @override
  void initState() {
    super.initState();
    // Forçar a orientação para horizontal
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Retorna à orientação padrão ao sair da página
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
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
        body: SingleChildScrollView(
          child: Row(
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
                            ActionButtonLeft(name: 'Ace', onPressed: () {}),
                            ActionButtonLeft(name: 'Ataque', onPressed: () {}),
                            ActionButtonLeft(
                                name: 'Bloqueio', onPressed: () {}),
                            ActionButtonLeft(name: 'Erro', onPressed: () {}),
                          ],
                        )),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ActionButtonRight(name: 'Ace', onPressed: () {}),
                            ActionButtonRight(name: 'Ataque', onPressed: () {}),
                            ActionButtonRight(
                                name: 'Bloqueio', onPressed: () {}),
                            ActionButtonRight(name: 'Erro', onPressed: () {}),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
