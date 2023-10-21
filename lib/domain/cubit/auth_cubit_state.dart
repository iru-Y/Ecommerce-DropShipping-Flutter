part of 'auth_cubit_cubit.dart';

sealed class AuthCubitState {
  String? token;

  AuthCubitState({this.token});
  
}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitLoading extends AuthCubitState {}

final class AuthCubitLoaded extends AuthCubitState {
   String? token;

  AuthCubitLoaded({this.token});
}

final class AuthCubitError extends AuthCubitState {}
