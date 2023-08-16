import 'package:flutter/material.dart';
import '../../domain/controllers/user_controller.dart';
import '../../utils/custom_styles.dart';
import '../shared/header_widget.dart';
import '../shared/button_large.dart.dart';
import '../shared/form_login_register.dart';
import '../shared/sign_signup.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController registerController = RegisterController();

  @override
  void initState() {
    registerController;
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
            FormLoginRegister(
              editingController: registerController.mailController,
              prefixIcon: 'assets/icons/mail_icon.png',
              title: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            FormLoginRegister(
              editingController: registerController.loginController,
              prefixIcon: 'assets/icons/person_login_icon.png',
              title: 'Usuário ou Email',
              inputType: TextInputType.text,
            ),
            FormLoginRegister(
              editingController: registerController.passwordController,
              prefixIcon: 'assets/icons/password_login_icon.png',
              title: 'Entrar',
              inputType: TextInputType.visiblePassword,
              sufixIcon: 'assets/icons/hidde_password_icon.png',
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) => setState(() {
                          isChecked = value!;
                        })),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ao criar uma conta, você concorda'),
                    Text('Com nossos termos e condições')
                  ],
                )
              ],
            ),
            const SizedBox(height:30),
            ButtonLarge(
              onPressed: () {
                registerController.register(context);
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
