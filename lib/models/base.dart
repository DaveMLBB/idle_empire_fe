class Base {
  int health;

  Base({this.health = 5000});

  bool isDestroyed() => health <= 0;
}