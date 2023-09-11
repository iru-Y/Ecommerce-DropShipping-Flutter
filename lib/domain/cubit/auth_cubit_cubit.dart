import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/repositories/auth_repository.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  AuthRepository authRepository = AuthRepository();

  Future<void> getToken(String login, String password) async {
    emit(AuthCubitLoading());

    try {
      await authRepository.generetadToken(login, password);
      emit(AuthCubitLoaded());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(AuthCubitInitial());
    } catch (e) {
        emit(AuthCubitError());
    }
  }

  void resetForm() {
    emit(AuthCubitInitial());
  }
}
