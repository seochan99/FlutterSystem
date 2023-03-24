String sayHello({
  required String name,
  required int age,
  required String country,
}) {
  return "hello $name, you are $age years old, from $country";
}

void main() {
  print(sayHello(
    age: 12,
    name: "John",
  ));
}
