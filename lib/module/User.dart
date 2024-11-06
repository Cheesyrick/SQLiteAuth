class User {
  late int? userid;
  late String? username;
  late String? password;

  User({this.userid, this.username, this.password});

  User.fromMap(dynamic obj) {
    userid = obj['userid'];
    username = obj['username'];
    password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'username': username, 'password': password};
    return map;
  }
}
