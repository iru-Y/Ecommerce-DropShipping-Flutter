import 'package:flutter/material.dart';
import 'package:trizi/view/pages/home/home_page.dart';
import 'package:trizi/view/shared/components/profile_info_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body:  SingleChildScrollView(
              child: Column(
                children: [
                  ProfileInfoWidget(),
                  HomePage(),

                  ]
                   ))));
  }
}
