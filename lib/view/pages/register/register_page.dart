import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/auth_cubit_cubit.dart';
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
  late final AuthCubit authCubit;
  final loginController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void initState() {
    userCubit = BlocProvider.of<UserCubit>(context);
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const HeaderWidget(
            txt1: 'Cadastre-se',
            txt2: 'Preencha com os seus dados para criar uma nova conta',
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
                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Stepper(
                        currentStep: currentStep,
                        onStepContinue: () {
                          if (currentStep < 2) {
                            setState(() {
                              currentStep++;
                            });
                          } else {
                            if (isChecked) {
                              () async {
                                final user = UserDto(
                                  name: nameController.text,
                                  lastName: lastNameController.text,
                                  login: loginController.text,
                                  password: passwordController.text,
                                  mail: emailController.text,
                                );
                                if (confirmPassController.text !=
                                    passwordController.text) {
                                  const Text(
                                    'as senhas não coincidem',
                                    style: TextStyle(color: Colors.red),
                                  );
                                }
                                await userCubit.post(user);
                              };
                            } else {
                              OnErrorWidget(
                                btnText: 'Recarregar',
                                title: 'Por favor, preencha os campos',
                                content: 'Os campos não podem estar vazios',
                                onConfirmBtnTap: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          }
                        },
                        onStepCancel: () {
                          if (currentStep > 0) {
                            setState(() {
                              currentStep--;
                            });
                          }
                        },
                        steps: [
                          Step(
                            title: const Text('Informações Pessoais'),
                            content: Column(
                              children: [
                                FormLoginRegister(
                                  editingController: emailController,
                                  prefixIcon: 'assets/icons/mail_icon.png',
                                  title: 'Email',
                                  inputType: TextInputType.emailAddress,
                                ),
                                FormLoginRegister(
                                  editingController: loginController,
                                  prefixIcon:
                                      'assets/icons/person_login_icon.png',
                                  title: 'Usuário',
                                  inputType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                          Step(
                            title: const Text('Informações de Contato'),
                            content: Column(
                              children: [
                                FormLoginRegister(
                                  editingController: nameController,
                                  prefixIcon:
                                      'assets/icons/password_login_icon.png',
                                  title: 'Senha 1',
                                  inputType: TextInputType.visiblePassword,
                                  sufixIcon:
                                      'assets/icons/hidde_password_icon.png',
                                ),
                                FormLoginRegister(
                                  editingController: lastNameController,
                                  prefixIcon:
                                      'assets/icons/password_login_icon.png',
                                  title: 'Senha 2',
                                  inputType: TextInputType.visiblePassword,
                                  sufixIcon:
                                      'assets/icons/hidde_password_icon.png',
                                ),
                                FormLoginRegister(
                                  editingController: emailController,
                                  prefixIcon:
                                      'assets/icons/password_login_icon.png',
                                  title: 'Senha 3',
                                  inputType: TextInputType.visiblePassword,
                                  sufixIcon:
                                      'assets/icons/hidde_password_icon.png',
                                ),
                              ],
                            ),
                          ),
                          const Step(
                            title: Text('Confirme'),
                            content: Column(
                              children: [
                                // Adicione campos de confirmação aqui, se necessário
                              ],
                            ),
                          ),
                        ],
                      ),
                  ]),
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
              return const SizedBox();
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: !isChecked,
                onChanged: (_) {
                  setState(() {
                    isChecked = false;
                  });
                },
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ao criar uma conta, você concorda'),
                  Text('Com nossos termos e condições')
                ],
              )
            ],
          ),
          ButtonLarge(
            onPressed: () async {
              if (isChecked) {
                final user = UserDto(
                  name: nameController.text,
                  lastName: lastNameController.text,
                  login: loginController.text,
                  password: passwordController.text,
                  mail: emailController.text,
                );
                if (confirmPassController.text != passwordController.text) {
                  const Text(
                    'as senhas não coincidem',
                    style: TextStyle(color: Colors.red),
                  );
                }
                await userCubit.post(user);
              } else {
                OnErrorWidget(
                  btnText: 'Recarregar',
                  title: 'Por favor, preencha os campos',
                  content: 'Os campos não podem estar vazios',
                  onConfirmBtnTap: () {
                    Navigator.of(context).pop();
                  },
                );
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
      ),
    );
  }
}
bool isChecked = true;
int currentStep = 0;