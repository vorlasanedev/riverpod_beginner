import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/user_notifier_provider.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {

  final TextEditingController _userController = TextEditingController();

  @override
  void dispose(){
    _userController.dispose();
    super.dispose();
    debugPrint('user screen dispose');
  }

  void _addUser() {
    ref.read(userNotifierProvider.notifier).update(_userController.text);
    _userController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider); // example if you need it later

    return Scaffold(
      appBar: AppBar(title: const Text('User Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      controller: _userController,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _addUser(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: (){
                      ref.read(userNotifierProvider.notifier).update(_userController.text);
                    },
                    child: const Text('Add User'),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: Text('User: $user', style: Theme.of(context).textTheme.titleMedium,),              
            ),
          ],
        ),
      ),
    );
  }


}
