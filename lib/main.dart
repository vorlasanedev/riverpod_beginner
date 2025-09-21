import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_beginner/screen/counter_async_screen.dart';
import 'package:riverpod_beginner/screen/user_list_screen.dart';
// import 'package:riverpod_beginner/screen/counter_screen.dart';
// import 'package:riverpod_beginner/screen/counter_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          // child: CounterScreen(),
          child: UserListScreen(),
        ),
      ),
    );
  }
}
