import 'package:flutter/foundation.dart';
import '../models/player.dart';

class AuthService extends ChangeNotifier {
  Player? _currentPlayer;

  Player? get currentPlayer => _currentPlayer;

  bool get isAuthenticated => _currentPlayer != null;

  Future<bool> login(String email, String password) async {
    // Implementa la logica di login
    // Per ora, creiamo semplicemente un giocatore fittizio
    _currentPlayer = Player(username: 'TestUser', email: email, password: password);
    notifyListeners();
    return true;
  }

  void logout() {
    _currentPlayer = null;
    notifyListeners();
  }
}