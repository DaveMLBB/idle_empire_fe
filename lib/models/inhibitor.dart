class Inhibitor {
  int health;

  Inhibitor({this.health = 500});

  bool isDestroyed() => health <= 0;
}
