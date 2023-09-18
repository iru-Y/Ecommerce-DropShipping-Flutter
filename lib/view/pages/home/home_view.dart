import 'package:flutter/material.dart';
import 'package:trizi/utils/dimens.dart';
import 'package:trizi/view/pages/home/home_page.dart';
import 'package:trizi/view/shared/components/profile_info_widget.dart';
import 'package:trizi/view/shared/list_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      const ProfileInfoWidget(),
      SizedBox(height: Dimens.getHeightPercentage(context, 0.05)),
      const HomePage(),
      SizedBox(height: Dimens.getHeightPercentage(context, 0.05)),
      const ListProduct()
    ]))));
  }
}
