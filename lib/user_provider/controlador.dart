import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user/user_provider/user.dart';
import 'package:http/http.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List> getListadoDeUsuarios() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Response response = await http.get(url);
  final List jsonData = jsonDecode(response.body);

  return jsonData.map((e) => User.fromJson(e)).toList();
}
hola como estas ol

