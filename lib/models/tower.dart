class Tower {
  int health;
  int damage;

  Tower({this.health = 1000, this.damage = 50});

  bool isDestroyed() => health <= 0;
}