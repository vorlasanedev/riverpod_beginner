import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_beginner/model/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default([]) List<User> users,
    @Default(false) bool isLoading,
    @Default(false) bool isAdded,
    String? error,
  }) = _UserState;
}
