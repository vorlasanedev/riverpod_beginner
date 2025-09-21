import 'package:flutter/material.dart';
// Import your AddUserScreen (assuming it is in the same directory or update with correct path)
import 'add_user_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Center(child: Text('No users added yet!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddUserScreen
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const AddUserScreen()));
        },
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
    );
  }
}
