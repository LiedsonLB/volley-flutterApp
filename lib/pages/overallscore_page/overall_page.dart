import 'package:flutter/material.dart';

class OverAllPage extends StatelessWidget {
  const OverAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Placar Geral'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: const Placeholder(),
    );
  }
}
