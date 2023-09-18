import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/domain/repositories/auth_repository.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  AuthRepository authRepository = AuthRepository();

  Future<Auth?> getToken(String login, String password) async {
    emit(AuthCubitLoading());

    try {
      final token = await authRepository.generateToken(login, password);
      emit(AuthCubitLoaded());
      return token;
    } catch (e) {
      emit(AuthCubitError());
      rethrow;
    }
  }

  void resetForm() {
    emit(AuthCubitInitial());
  }
}
