part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserCubitInitial extends UserState {}

final class UserCubitLoading extends UserState {}

final class UserCubitLoaded extends UserState {
  final List<User>? users;
  final User? user;

  UserCubitLoaded({this.users, this.user});

  @override
  String toString() {
    return '$users';
  }
}

final class UserCubitError extends UserState {}