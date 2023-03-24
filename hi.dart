void main() {
  var oldFriends = ['John', 'Paul', 'George', 'Ringo'];
  var newFriends = [
    'lewis',
    'ralph',
    for (var friend in oldFriends) "z $friend",
  ];

  print(newFriends);
}
