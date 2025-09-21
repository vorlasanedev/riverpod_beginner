import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/view_model/user_view_model.dart';

class AddUserScreen extends ConsumerStatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends ConsumerState<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _listener();
  }

  @override
  void dispose() {
    _idController.dispose();
    _usernameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _listener() {
    // Listen to changes in the provider's state
    ref.listen(usersProvider, (previous, next) {
      // Assuming your provider has a property 'isAdded' to indicate success
      if (next.isAdded) {
        Navigator.of(context).pop(); // Close the add screen
      }
    });
  }

  void _addUser() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      final user = User(
        id: int.tryParse(_idController.text) ?? -1,
        username: _usernameController.text,
        age: int.tryParse(_ageController.text) ?? -1,
        email: _emailController.text,
      );

      // Call your ViewModel / Provider to add user
      ref.read(usersProvider.notifier).addUser(user);
    }
  }

  void _saveUser() {
    if (_formKey.currentState!.validate()) {
      _addUser(); // add the user via provider
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(labelText: 'ID'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ID';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUser,
                child: const Text('Save User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
