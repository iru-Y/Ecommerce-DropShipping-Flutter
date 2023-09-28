import 'package:flutter/material.dart';
import 'package:trizi/view/pages/home/home_page.dart';
import 'package:trizi/view/shared/list_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: [
        HomeHeader(),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text('Recomendados para você')),
        ListProduct()
      ]),
    )
    ));
  }
}
