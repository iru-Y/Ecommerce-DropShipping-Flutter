import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:trizi/domain/controllers/user_controller.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit() : super(UserCubitInitial());

  UserController userController = UserController();

  Future<void> getUser(String login, String password) async {
    emit(UserCubitLoading());

    try {
      await userController.login(login, password);

      emit(UserCubitLoaded());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(UserCubitInitial());
    } catch (e) {
      emit(UserCubitError());
    }
  }

  Future<void> postUser(String login, String password) async {
    emit(UserCubitLoading());

    try {
      await userController.register(login, password);

      emit(UserCubitLoaded());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(UserCubitInitial());
    } catch (e) {
      emit(UserCubitError());
    }
  }

  void resetForm() {
    emit(UserCubitInitial());
  }

  void checkTerms(bool check) {}
}
