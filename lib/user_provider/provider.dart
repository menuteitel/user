import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/user_provider/home_page.dart';
import 'package:user/user_provider/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _user = [];

  List<User> get user => _user;

  bool _cargandoDatos = false;
  bool get cargandoDatos => _cargandoDatos;

  // get charged => null;

  // get file => null;

  // agregarALaLista() {}

  Future getUserData() async {
    _cargandoDatos = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var datosJson;
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      Response response = await http.get(url);
      prefs.setString('data', response.body);

      final List jsonData = jsonDecode(response.body);
      datosJson = response.body;
      return jsonData.map((e) => User.fromJson(e)).toList();

      // getUserData();
    } catch (e) {
      datosJson = prefs.getString('data');
    }

    var map = jsonDecode(datosJson);

    List userData = jsonDecode(datosJson);
    // List<User> usersList = Data.fromJson(map).data;

    List<User> userList =
        List<User>.from(userData.map((x) => User.fromJson(x)));

    _user.addAll(userList);
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
