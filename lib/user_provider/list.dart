import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:user/user_provider/add_user.dart';
import 'package:user/user_provider/home_page.dart';
import 'package:user/user_provider/provider.dart';
import 'package:user/user_provider/user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      
      onRefresh: () => context.read<UserProvider>().getUserData(),
      child: Consumer<UserProvider>(builder: (BuildContext context, data, _) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddUser(),
                )),
          ),
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: SafeArea(
            child: _builList(data, context),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: Text('user list'),
                ),
                ListTile(
                  title: const Text('List'),
                  tileColor: Colors.amber,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      )),
                ),
              ],
            ),
          ),
        );
        // ignore: dead_code
      }),
    );
  }

  Widget _builList(UserProvider data, BuildContext context) {
    if (data.cargandoDatos == false) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (data.user.isEmpty) {
      return const Center(
        child: Text('Empty List'),
      );
    }
    return ListView(
      children: createUserList(data.user, context),
    );
  }

  createUserList(List<User> user, BuildContext context) {}
}
