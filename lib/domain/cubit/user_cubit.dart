import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/models/user.dart';
import 'package:trizi/domain/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserCubitInitial());
  UserRepository userRepository = UserRepository();

  Future<List<User>> getAll() async {
    emit(UserCubitLoading());
    try {
      final users = await userRepository.getAll();
      emit(UserCubitLoaded(users: users));
      return users;
    } catch (e) {
      emit(UserCubitError());
      rethrow;
    }
  }

  Future<User?> getByLogin() async{
    emit(UserCubitLoading());
     try {
      final user = await userRepository.getByLogin();
      emit(UserCubitLoaded(user: user));
      return user;
    } catch (e) {
      emit(UserCubitError());
      rethrow;
    }
  }
}
