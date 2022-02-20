// import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/user_provider/home_page.dart';
import 'package:user/user_provider/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _user = [];

  List<User> get user => _user;

  bool _cargandoDatos = false;
  bool get cargandoDatos => _cargandoDatos;

  get Data => null;

  // agregarALaLista() {}

  Future getUserData() async {
    // var loading = true;
    // notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson;
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      prefs.setString('Data', response.body);
      final List jsonData = jsonDecode(response.body);
      datosJson = response.body;
      return jsonData.map((e) => User.fromJson(e)).toList();

      // getUserData();
    } catch (e) {
      datosJson = prefs.getString('Data')!;
    }
    Map map = jsonDecode(datosJson);

    List userData = jsonDecode(datosJson);
    List<User> usersList = Data.fromJson(map).data;
    String userToJson(List<User> data) =>
        json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
    // List<User>.from(usuariosData.map((x) => User.fromJson(x)));

    _user.addAll(usersList);
    _user.clear();
    _cargandoDatos = false;
    notifyListeners();
  }

  void addNewUser(
      {required String email,
      required String firstName,
      required String userName}) {}

  static init() {}

  void eliminarUsuario(String username) {}
}
























// import 'package:provider/provider.dart';
// import 'package:user/user_provider/provider.dart';
// import 'package:user/user_provider/user.dart';
// import 'package:user/user_provider/user_details.dart';

// List<Widget> createUserList(List<User> user, BuildContext context) {
//   return user.map((User users) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => UserDetails(users),
//               ));
//         },
//         tileColor: Colors.orange,
//         title: Text(users.name),
//       ),
//     );
//   }).toList();
// }




