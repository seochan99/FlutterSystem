class Player {
  final String name;
  int xp, age;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = "blue",
        this.xp = 0;

  Player.createRedPlayer(String name, int age)
      : this(
          name: name,
          age: age,
          team: "red",
          xp: 0,
        );

  void sayHello() {
    print("Hello, my name is $name");
  }
}

void main() {
  var player = Player.createBluePlayer(
    name: "max",
    age: 20,
  );
  player.sayHello();

  var redPlayer = Player.createRedPlayer(
    "lucy",
    30,
  );
  redPlayer.sayHello();
}
