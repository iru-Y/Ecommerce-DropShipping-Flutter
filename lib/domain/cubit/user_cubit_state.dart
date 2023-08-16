part of 'user_cubit.dart';

@immutable
sealed class UserCubitState {}

final class UserCubitInitial extends UserCubitState {
  List<User> get users => [];
}

final class UserCubitLoading extends UserCubitState {
  List<User> get users => [];
}

final class UserCubitLoaded extends UserCubitState {
  
}

final class UserCubitError extends UserCubitState {
  List<User> get users => [];
}
