import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/user_cubit.dart';
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/utils/routes.dart';
import 'package:trizi/view/shared/components/on_error_widget.dart';
import '../../../utils/custom_styles.dart';
import '../../shared/header_widget.dart';
import '../../shared/button_large.dart.dart';
import '../../shared/form_login_register.dart';
import '../../shared/sign_signup.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final UserCubit userCubit;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  UserDto userDto = UserDto();

  @override
  void initState() {
    userCubit = BlocProvider.of<UserCubit>(context);
    userDto;
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
                bloc: userCubit,
                builder: (context, state) {
                  if (state is UserCubitLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is UserCubitInitial) {
                    return Column(
                      children: [
                        FormLoginRegister(
                          editingController: emailController,
                          prefixIcon: 'assets/icons/mail_icon.png',
                          title: 'Email',
                          inputType: TextInputType.emailAddress,
                        ),
                        FormLoginRegister(
                          editingController: loginController,
                          prefixIcon: 'assets/icons/person_login_icon.png',
                          title: 'Usuário',
                          inputType: TextInputType.text,
                        ),
                        FormLoginRegister(
                          editingController: passwordController,
                          prefixIcon: 'assets/icons/password_login_icon.png',
                          title: 'Senha',
                          inputType: TextInputType.visiblePassword,
                          sufixIcon: 'assets/icons/hidde_password_icon.png',
                        ),
                      ],
                    );
                  }
                  if (state is UserCubitError) {
                    return SizedBox(
                      child: OnErrorWidget(
                        btnText: 'Recarregar',
                        title: 'Erro de comunicação',
                        content:
                            'Falha ao comunicar-se com o servidor, tente novamente',
                        onConfirmBtnTap: () {
                          context.read<UserCubit>().resetForm();
                        },
                      ),
                    );
                  }

                  if (state is UserCubitLoaded) {
                    Future.delayed(Duration.zero, () {
                      context.read<UserCubit>().resetForm();
                      Navigator.of(context).pushNamed(AppRoute.LOGIN);
                    });
                  }
                  return SizedBox();
                }),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ao criar uma conta, você concorda'),
                    Text('Com nossos termos e condições')
                  ],
                )
              ],
            ),
            const SizedBox(height: 200),
            ButtonLarge(
              onPressed: () async {
                if (isChecked) {
                  final u = userDto.login = loginController.text;
                  final p = userDto.password = passwordController.text;
                  final m = userDto.mail = emailController.text;
                  final user = UserDto(login: u, password: p, mail: m);
                  await userCubit.post(user);
                  OnErrorWidget(
                    btnText: 'ok',
                    content: 'ok',
                    onConfirmBtnTap: () =>
                        Navigator.of(context).pushNamed(AppRoute.LOGIN),
                    title: 'ok',
                  );
                } else {
                  OnErrorWidget(
                      btnText: 'Recarregar',
                      title: 'Por favor, preencha os campos',
                      content: 'Os campos não podem estar vazios',
                      onConfirmBtnTap: () {
                        Navigator.of(context).pop();
                      });
                }
              },
              backgroundColor: ColorsCustom.BUTTON_COLOR_LOGIN_1,
              text: 'REGISTRAR',
              sufixIcon: 'assets/icons/btn_sign_icon.png',
            ),
            SignSignup(
              text1: 'Já tem uma conta? ',
              text2: 'Entrar',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ButtonLarge(
              onPressed: () {},
              backgroundColor: ColorsCustom.BUTTON_COLOR_LOGIN_2,
              sufixIcon: 'assets/icons/facebook_icon.png',
              text: 'Conecte com o Facebook',
            ),
          ],
        ));
  }
}

bool isChecked = false;
