part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final List<UserDto>? users;
  final UserDto? user;
  const UserState({this.users, this.user});

  @override
  String toString() {
    return '$users';
  }
}

final class UserCubitInitial extends UserState {
  final List<UserDto>? users;
  final UserDto? user;
  const UserCubitInitial({this.users, this.user});

  @override
  String toString() {
    return '$users';
  }
}

final class UserCubitLoading extends UserState {}

final class UserCubitLoaded extends UserState {
  final List<UserDto>? users;
  final UserDto? user;
  const UserCubitLoaded({this.users, this.user});

  @override
  String toString() {
    return '$users';
  }
}

final class UserCubitError extends UserState {}
