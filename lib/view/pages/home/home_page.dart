import 'package:flutter/material.dart';
import 'package:trizi/view/shared/components/profile_info_widget.dart';
import 'package:trizi/view/shared/list_product.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: ProfileInfoWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text('Escolha por categoria'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: ListProduct(),
        )
      ],
    );
  }
}
