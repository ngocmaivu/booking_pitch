class Admin {
  String admin;
  String password;
  Admin({this.admin, this.password});

  @override
  String toString() {
    return 'Admin{admin: $admin, password: $password}';
  }
}

List<Admin> LIST_ADMIN = [Admin(password: "123", admin: "a")];
