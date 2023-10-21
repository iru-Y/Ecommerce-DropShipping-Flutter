import 'package:flutter/material.dart';
import 'package:trizi/view/mobile/pages/login/login_page.dart';

class MobileLoginView extends StatelessWidget {
  const MobileLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body: LoginPage()
      ),
    );
  }
}
