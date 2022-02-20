import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:user/user_provider/provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) => value!.length > 3 ? null : 'Error',
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Add Email',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Add First Name',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'Add User Name',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: 'Add Phone Number',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty ||
                    nameController.text.isEmpty ||
                    userNameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('There are empty spaces')));
                } else {
                  context.read<UserProvider>().addNewUser(
                        email: emailController.text,
                        firstName: nameController.text,
                        userName: userNameController.text,
                      );
                  _clearData();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Saved')));
                }
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  void _clearData() {
    emailController.clear();
    userNameController.clear();
    nameController.clear();
  }
}
