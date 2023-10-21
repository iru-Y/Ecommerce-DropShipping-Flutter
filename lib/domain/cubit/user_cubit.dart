import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/exceptions/database_exception.dart';
import 'package:trizi/domain/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserCubitInitial());
  UserRepository userRepository = UserRepository();

  Future<List<UserDto>> getAll() async {
    emit(UserCubitLoading());
    try {
      final users = await userRepository.getAll();
      emit(UserCubitLoaded(users: users));
      return users;
    } catch (e) {
      emit(UserCubitError());
      throw DatabaseException('$e');
    }
  }

  Future<UserDto> getByMail(String mail, String token) async {
    emit(UserCubitLoading());
    try {
      final user = await userRepository.getByMail(mail, token);
      user == null 
      ? throw Exception("o User do getByMail do userCubit está nullo") 
      : emit(UserCubitLoaded(user: user)); 
      return user;
    } catch (e) {
      emit(UserCubitError());
      throw DatabaseException('$e');
    }
  }

  Future<void> post(UserDto userDto) async {
    emit(UserCubitLoading());
    try {
      emit(UserCubitLoaded());
      await userRepository.post(userDto);
    } catch (e) {
      emit(UserCubitError());
      throw DatabaseException('$e');
    }
  }

  void resetForm() {
    emit(const UserCubitInitial());
  }
}
