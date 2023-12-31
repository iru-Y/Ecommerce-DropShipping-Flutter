import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/auth_cubit_cubit.dart';
import 'package:trizi/domain/cubit/user_cubit.dart';
import 'package:trizi/domain/dtos/user_dto.dart';
import 'package:trizi/utils/routes.dart';
import 'package:trizi/view/shared/components/on_error_widget.dart';
import '../../../../utils/custom_styles.dart';
import '../../../shared/header_widget.dart';
import '../../../shared/button_large.dart.dart';
import '../../../shared/form_login_register.dart';
import '../../../shared/sign_signup.dart';

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
                                    content:
                                        'Os campos não podem estar vazios',
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
                                      editingController: nameController,
                                      title: 'Nome',
                                      inputType: TextInputType.text,
                                    ),
                                    FormLoginRegister(
                                      editingController: lastNameController,
                                      title: 'Login',
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
                                      editingController: emailController,
                                      title: 'email',
                                      inputType:
                                          TextInputType.visiblePassword,
                                    ),
                                    FormLoginRegister(
                                      editingController: passwordController,
                                      title: 'password',
                                      inputType:
                                          TextInputType.visiblePassword,
                                    ),
                                    FormLoginRegister(
                                      editingController:
                                          confirmPassController,
                                      title: 'Confirme',
                                      inputType:
                                          TextInputType.visiblePassword,
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
                  Navigator.of(context).pushNamed(AppRoute.MOBILE_LOGIN);
                });
              }
              return const SizedBox();
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (_) {
                  setState(() {
                    isChecked = !isChecked;
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
            backgroundColor: CustomColor.BUTTON_COLOR_LOGIN_1,
            text: 'REGISTRAR',
            sufixIcon: 'assets/icons/btn_sign_icon.png',
          ),
          SignSignup(
            text1: 'Já tem uma conta? ',
            text2: 'Entrar',
            onTap: () {
              Navigator.pushNamed(context, AppRoute.MOBILE_LOGIN);
            },
          ),
          ButtonLarge(
            onPressed: () {},
            backgroundColor: CustomColor.BUTTON_COLOR_LOGIN_2,
            sufixIcon: 'assets/icons/facebook_icon.png',
            text: 'Conecte com o Facebook',
          ),
        ],
      ),
    );
  }
}

bool isChecked = false;
int currentStep = 0;
