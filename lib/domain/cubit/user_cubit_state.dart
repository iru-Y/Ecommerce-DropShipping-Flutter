part of 'user_cubit.dart';

@immutable
sealed class UserCubitState {}

final class UserCubitInitial extends UserCubitState {
 
}

final class UserCubitLoading extends UserCubitState {
 
}

final class UserCubitLoaded extends UserCubitState {
  
}

final class UserCubitError extends UserCubitState {

}
