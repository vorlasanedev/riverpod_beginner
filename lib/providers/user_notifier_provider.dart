import 'package:flutter_riverpod/flutter_riverpod.dart';

// final userNotifierProvider = NotifierProvider<UserNotifier, String>(UserNotifier.new);
final userNotifierProvider = AutoDisposeNotifierProvider<UserNotifier, String>(UserNotifier.new);

class UserNotifier extends AutoDisposeNotifier<String>{
  @override
  String build() {
    return '-';
  }

  void update(String value){
    state = value;
  }


}