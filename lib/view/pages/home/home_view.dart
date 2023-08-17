import 'package:flutter/material.dart';

import 'home_page.dart';
    
class HomeView extends StatelessWidget {

  const HomeView({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}