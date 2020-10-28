class User {
  String username;
  String password;
  User({this.username, this.password});

  @override
  String toString() {
    return 'User{username: $username, password: $password}';
  }
}

List<User> LIST_USER = [User(password: "Tien", username: "Tien")];
