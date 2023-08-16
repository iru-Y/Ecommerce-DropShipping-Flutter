import 'package:flutter/material.dart';
import 'package:trizi/view/login/login_page.dart';
    
class LoginView extends StatelessWidget {

  const LoginView({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: LoginPage())
      ),
    );
  }
}