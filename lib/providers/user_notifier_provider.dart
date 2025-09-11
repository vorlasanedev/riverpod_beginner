import 'dart:async';

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final userNotifierProvider = NotifierProvider<UserNotifier, String>(UserNotifier.new);
final userNotifierProvider = AutoDisposeNotifierProvider<UserNotifier, String>(
  UserNotifier.new,
);

class UserNotifier extends AutoDisposeNotifier<String> {
  @override
  String build() {
    final keepAlive = ref.keepAlive();
    Timer? timer;

    ref.onDispose(() {
      debugPrint('User Notifier Dispose');
      timer?.cancel();
    });

    ref.onCancel(() {
      debugPrint('User Notifier Cancel is called');
      timer = Timer(const Duration(seconds: 10), () {
        keepAlive.close();
        debugPrint('User Notifier onCancel');
      });
    });

    ref.onResume(() {
      debugPrint('User Notifier onResume is called');
      timer?.cancel();
    });

    return '-';
  }

  void update(String value) {
    state = value;
  }
}
