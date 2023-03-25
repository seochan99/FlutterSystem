class Player {
  final String name;
  int xp;

  Player(this.name, this.xp);
  void sayHello() {
    print("Hello, my name is $name");
  }
}

void main() {
  var player1 = Player("Chan", 100);
  player1.sayHello();

  var player2 = Player("min", 120);
  player2.sayHello();
}
