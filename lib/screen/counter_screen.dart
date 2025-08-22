import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/counter_notifier_provider.dart';
// import 'package:riverpod_beginner/providers/counter_state_provider.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {


  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterStateProvider);
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('counter'),),
      body: Column(
        children: [
          Text('You have pushed the button this many times: $counter'),
          Text('$counter', style: Theme.of(context).textTheme.headlineMedium,)
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState(() {
                // ref.read(counterStateProvider.notifier).state++;
                ref.read(counterNotifierProvider.notifier).decrement();
              });
            },
            tooltip: 'Decreasement',
            child: const Icon(Icons.minimize),
            ),
            const SizedBox(width: 10,),
            FloatingActionButton(
            onPressed: (){
              setState(() {
                // ref.read(counterStateProvider.notifier).state--;
                ref.read(counterNotifierProvider.notifier).increment();
              });
            },
            tooltip: 'Increasement',
            child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10,),
            FloatingActionButton(
            onPressed: (){
              setState(() {
                // ref.read(counterStateProvider.notifier).state--;
                ref.read(counterNotifierProvider.notifier).reset();
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