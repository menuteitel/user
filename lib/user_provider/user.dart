import 'dart:convert';

// cimport 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final String name;
  final String username;
  final String email;
  // final String address;
  final String phone;
  final String website;

  User({
    required this.name,
    required this.username,
    required this.email,
    // required this.address,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        // address: json["address"],
        phone: json["phone"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        // "address": address,
        "phone": phone,
        "website": website,
      };

  // get(Uri uri) {}
}
