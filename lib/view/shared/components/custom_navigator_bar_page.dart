import 'package:flutter/material.dart';
import 'package:trizi/utils/routes.dart';

class CustomNavigatorBarPage extends StatefulWidget {
  const CustomNavigatorBarPage({Key? key}) : super(key: key);

  @override
  State<CustomNavigatorBarPage> createState() => _CustomNavigatorBarPageState();
}

class NavBarItem {
  final String icon;
  final String label;

  NavBarItem(this.icon, this.label);
}

mixin class Assets {
  final List<NavBarItem> items = [
    NavBarItem('assets/icons/home_icon.png', 'Início'),
    NavBarItem('assets/icons/order_icon.png', 'Pesquisar'),
    NavBarItem('assets/icons/search_icon.png', 'Sacola'),
    NavBarItem('assets/icons/person_login_icon.png', 'Perfil'),
  ];
}

class _CustomNavigatorBarPageState extends State<CustomNavigatorBarPage>
    with Assets {
  int currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      List<String> routes = AppRoute.navigatorRoutes;
      Navigator.of(context).pushNamed(routes[index]);
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onItemTapped,
      iconSize: 23,
      items: List.generate(items.length, (i) {
        return BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label: items[i].label,
          icon: ImageIcon(
            AssetImage(items[i].icon),
            color: Colors.black,
          ),
        );
      }),
    );
  }
}
