import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:user/user_provider/provider.dart';
import 'package:user/user_provider/user.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(
//           child: Container(
//             child: Text('Hello World'),
//           ),
//         ),
//       ),
//     );
//   }
// }

class UserDetails extends StatelessWidget {
  final User users;
  const UserDetails(this.users, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pop(context);
          context.read<UserProvider>().eliminarUsuario(users.username);
        },
        child: Icon(
          Icons.delete,
        ),
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text('Username: ${users.username}'),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${users.name} ${users.email}',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
