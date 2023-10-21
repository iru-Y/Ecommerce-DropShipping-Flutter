import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/domain/repositories/auth_repository.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  AuthRepository authRepository = AuthRepository();

  Future<Auth<UserDto>> getToken(String? mail, String? password) async {
    emit(AuthCubitLoading());
    try {
      final token = await authRepository.generateToken(mail, password);
      emit(AuthCubitLoaded(token: token.token));
      return token;
    } catch (e) {
      emit(AuthCubitError());
      rethrow;
    }
  }

  void resetForm() {
    emit(AuthCubitInitial());
  }
  void resetToken() {
    state.token = null;
  }
}
