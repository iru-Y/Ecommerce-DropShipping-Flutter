import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/user_cubit.dart';
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/domain/models/auth.dart';
import 'package:trizi/utils/custom_styles.dart';
import 'package:trizi/utils/dimens.dart';
import 'package:trizi/utils/routes.dart';
import 'package:trizi/view/shared/button_large.dart.dart';
import 'package:trizi/view/shared/form_login_register.dart';
import 'package:trizi/view/shared/sign_signup.dart';

import '../../../../domain/cubit/auth_cubit_cubit.dart';
import '../../../shared/components/on_error_widget.dart';
import '../../../shared/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthCubit authCubit;

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const HeaderWidget(
              txt1: 'Bem-vindo de volta',
              txt2: 'Vamos conectar você',
            ),
            BlocBuilder(
              bloc: authCubit,
              builder: (context, state) {
                if (state is AuthCubitInitial) {
                  return Column(
                    children: [
                      FormLoginRegister(
                        editingController: mailController,
                        prefixIcon: 'assets/icons/person_login_icon.png',
                        title: 'Usuário ou Email',
                        inputType: TextInputType.text,
                      ),
                      FormLoginRegister(
                        editingController: passwordController,
                        prefixIcon: 'assets/icons/password_login_icon.png',
                        title: 'Entrar',
                        inputType: TextInputType.text,
                        sufixIcon: 'assets/icons/hidde_password_icon.png',
                      ),
                    ],
                  );
                }
                if (state is AuthCubitLoading) {
                  return const CircularProgressIndicator();
                }

                if (state is AuthCubitLoaded) {
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).pushReplacementNamed(AppRoute.MOBILE_HOME);
                  });
                }       

                if (state is AuthCubitError) {
                  if (mailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OnErrorWidget(
                          btnText: 'Recarregar',
                          title: 'Login ou senha não podem ficar nulos',
                          content: 'Por favor, preencha todos os campos',
                          onConfirmBtnTap: context.read<AuthCubit>().resetForm),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OnErrorWidget(
                        btnText: 'Recarregar',
                        title: 'Login ou senha inválidos',
                        content: 'Por favor, verifique suas credenciais',
                        onConfirmBtnTap: context.read<AuthCubit>().resetForm),
                  );
                }
                return const SizedBox();
              },
            ),
            spaceAround,
            ButtonLarge(
              onPressed: () async {
                  final userDto = Auth<UserDto>(
    user: UserDto(
      mail: mailController.text,
      password: passwordController.text,
    ),
  );
  await authCubit.getToken(userDto.user!.mail!, userDto.user!.password!);
  final token = authCubit.state.token;
  await context.read<UserCubit>().getByMail(userDto.user!.mail!, token!);
  },
              backgroundColor: CustomColor.BUTTON_COLOR_LOGIN_1,
              text: 'ENTRAR',
              sufixIcon: 'assets/icons/btn_sign_icon.png',
            ),
            SignSignup(
              text1: 'Não tem uma conta? ',
              text2: 'Registre-se',
              onTap: () {
                Navigator.pushNamed(context, AppRoute.MOBILE_REGISTER);
              },
            ),
            ButtonLarge(
              onPressed: () {},
              backgroundColor: CustomColor.BUTTON_COLOR_LOGIN_2,
              sufixIcon: 'assets/icons/facebook_icon.png',
              text: 'Conecte com o Facebook',
            ),
          ],
        ));
  }
}

bool isChecked = true;
