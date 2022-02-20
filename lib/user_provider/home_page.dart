import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/user_provider/provider.dart';
import 'dart:async';

import 'package:user/user_provider/user.dart';
import 'package:user/user_provider/user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool loading;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () =>
                Provider.of<UserProvider>(context, listen: false).getUserData(),
          ),
          appBar: AppBar(
            title: const Text('Listado de usuairos'),
          ),
          body: SafeArea(
            child: Consumer<UserProvider>(
              builder: (BuildContext context, data, _) {
                if (data.user.isEmpty) {
                  return const Center(
                    child: Text("Empty List"),
                  );
                }

                List<Widget> widgetUser = data.user.map((User users) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => UserDetails(users),
                            ));
                      },
                      tileColor: Colors.orange,
                      title: Text(users.name),
                    ),
                  );
                }).toList();
                return ListView(
                  children: widgetUser,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
