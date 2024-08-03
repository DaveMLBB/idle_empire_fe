import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idle_empire/screens/login_screen.dart';
import 'package:idle_empire/services/auth_service.dart';
import 'package:idle_empire/services/game_services.dart';
import 'package:provider/provider.dart';

import 'models/player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProxyProvider<AuthService, GameService>(
          create: (context) => GameService(player: Player(username: '', email: '', password: '')),
          update: (context, authService, previousGameService) =>
              GameService(player: authService.currentPlayer ?? Player(username: '', email: '', password: '')),
        ),
      ],
      child: MaterialApp(
        title: 'Idle Empire',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<AuthService>(
          builder: (context, authService, child) {
            return authService.isAuthenticated ? HomeScreen() : LoginScreen();
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameService = Provider.of<GameService>(context);
    final player = gameService.player;

    return Scaffold(
      appBar: AppBar(title: Text('Idle Empire')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome, ${player.username}!'),
          Text('Gold: ${player.gold}'),
          Text('Diamonds: ${player.diamonds}'),
          Text('Idle Level: ${player.idleLevel}'),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BattleScreen())),
            child: Text('Start Battle'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => IdleScreen())),
            child: Text('Idle Mode'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HeroManagementScreen())),
            child: Text('Manage Heroes'),
          ),
          ElevatedButton(
            onPressed: gameService.watchAd,
            child: Text('Watch Ad for Diamonds'),
          ),
        ],
      ),
    );
  }
}

class BattleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Battle')),
      body: Center(child: Text('Battle screen implementation')),
    );
  }
}

class IdleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameService = Provider.of<GameService>(context);
    final player = gameService.player;

    return Scaffold(
      appBar: AppBar(title: Text('Idle Mode')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Idle Level: ${player.idleLevel}'),
          Text('Gold: ${player.gold}'),
          ElevatedButton(
            onPressed: () {
              // Implementa la logica per combattere un boss
             // gameService.fightBoss(/* passa un boss */);
            },
            child: Text('Fight Boss'),
          ),
        ],
      ),
    );
  }
}

class HeroManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Heroes')),
      body: Center(child: Text('Hero management screen implementation')),
    );
  }
}