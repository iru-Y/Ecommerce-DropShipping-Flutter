import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trizi/utils/custom_styles.dart';
import 'package:trizi/utils/fonts.dart';
import 'package:trizi/view/shared/button_large.dart.dart';
import 'package:trizi/view/shared/sign_signup.dart';

class AprensentationView extends StatelessWidget {
  const AprensentationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Expanded(
          child: SizedBox(
        child: Stack(children: [
          Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset('assets/images/home_pic_right.svg')),
          Positioned(
              left: 0,
              bottom: 0,
              child: SvgPicture.asset('assets/images/home_pic_left.svg')),
          Positioned(
            left: 0,
            bottom: 0,
            child: SvgPicture.asset('assets/images/home_pic_center.svg'),
          )
        ]),
      )),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Bem-vindo a Edson Store',
              style: DMSANS_BLACK,
            ),
            const SizedBox(height: 20),
            const Text(
              'Referência em vendas',
              style: DMSANS_LIGHT,
            ),
            const Expanded(child: SizedBox()),
            ButtonLarge(
                backgroundColor: ColorsCustom.BUTTON_COLOR_LOGIN_1,
                text: 'Começar',
                sufixIcon: 'assets/icons/arrow-right_icon.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                }),
               SignSignup(
              text1: 'Já tem uma conta? ',
              text2: 'Entrar',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              })
          ],
        ),
      ))
    ])));
  }
}
