import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/counter_async_notifier_provider.dart';
// import 'package:riverpod_beginner/providers/counter_notifier_provider.dart';
// import 'package:riverpod_beginner/providers/user_notifier_provider.dart';
import 'package:riverpod_beginner/screen/user_screen.dart';

class CounterAsyncScreen extends ConsumerStatefulWidget {
  const CounterAsyncScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CounterAsyncScreenState();
}

class _CounterAsyncScreenState extends ConsumerState<CounterAsyncScreen> {
  @override
  Widget build(BuildContext context) {
    final counterAsync = ref.watch(counterAsyncNotifierProvider);
    // final user = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Async'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            tooltip: 'Add User',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            counterAsync.when(
              data: (data) => Text('You have to push many time: $data'),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'fab_decreasement',
            onPressed: () {
              setState(() {
                ref.read(counterAsyncNotifierProvider.notifier).decrement();
              });
            },
            tooltip: 'Decreasement',
            child: const Icon(Icons.minimize),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'fab_increment',
            onPressed: () {
              setState(() {
                ref.read(counterAsyncNotifierProvider.notifier).increment();
              });
            },
            tooltip: 'Increasement',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'fab_reset',
            onPressed: () {
              setState(() {
                ref.read(counterAsyncNotifierProvider.notifier).reset();
              });
            },
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}
