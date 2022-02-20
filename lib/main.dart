import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/user_provider/home_page.dart';
import 'package:user/user_provider/list.dart';
import 'package:user/user_provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          title: "hola",
          initialRoute: "/home_page",
          routes: {
            '/': (_) => Home(),
            '/home_page': (_) => Home(),
            '/page': (_) => const HomePage(),
          }),
    );
  }
}
