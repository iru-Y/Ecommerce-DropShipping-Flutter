import 'package:flutter/material.dart';
import 'package:trizi/view/mobile/pages/register/register_page.dart';

class MobileRegisterView extends StatelessWidget {
  const MobileRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              RegisterPage(),
            ],
          ),
        ),
      ),
    );
  }
}
