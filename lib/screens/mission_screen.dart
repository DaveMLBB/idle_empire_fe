import 'package:flutter/material.dart';

import '../services/game_services.dart';

class MissionScreen extends StatelessWidget {
  final GameService gameService;

  MissionScreen({required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Missioni')),
      body: Column(
        children: [
          //Text('Missioni completate: ${gameService.player.completedMissions}'),
          Text('Livello Idle: ${gameService.player.idleLevel}'),
          ElevatedButton(
            onPressed: () {
              //gameService.completeMission();
              // Aggiorna l'UI o naviga alla schermata di battaglia se è una battaglia con il boss
            },
            child: Text('Completa Missione'),
          ),
        ],
      ),
    );
  }
}