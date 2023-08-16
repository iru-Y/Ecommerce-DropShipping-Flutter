import 'package:flutter/material.dart';
import 'package:trizi/view/register/register_page.dart';
    
class RegisterView extends StatelessWidget {

  const RegisterView({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: RegisterPage()),
    );
  }
}