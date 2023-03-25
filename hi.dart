class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  void sayHello() {
    print("Hello, my name is $name");
  }
}

void main() {
  var player1 = Player(
    name: "max",
    xp: 100,
    team: "red",
    age: 20,
  );
  player1.sayHello();

  var player2 = Player(
    name: "lucy",
    xp: 200,
    team: "blue",
    age: 30,
  );
  player2.sayHello();
}
