import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserCubitInitial());
  UserRepository userRepository = UserRepository();

  Future<List<UserDto>?> getAll() async {
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

  Future<UserDto?> getByLogin(String login) async {
    emit(UserCubitLoading());
    try {
      final user = await userRepository.getByLogin(login);
      emit(UserCubitLoaded(user: user));
      emit(UserCubitInitial());
      return user;
    } catch (e) {
      emit(UserCubitError());
      rethrow;
    }
  }

  Future<void> post(UserDto userDto) async {
    emit(UserCubitLoading());
    try {
      final resp = await userRepository.createUser(userDto);
      emit(UserCubitLoaded(user: userDto));
      resp;
    } catch (e) {
      emit(UserCubitError());
      rethrow;
    }
  }

  void resetForm() {
    emit(UserCubitInitial());
  }
}
