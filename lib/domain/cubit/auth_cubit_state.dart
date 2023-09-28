part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitLoading extends AuthCubitState {}

final class AuthCubitLoaded extends AuthCubitState {
  final UserDto? user;

  AuthCubitLoaded({this.user});
}

final class AuthCubitError extends AuthCubitState {}
