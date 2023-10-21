import 'package:flutter/material.dart';

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

class _CustomNavigatorBarPageState extends State<CustomNavigatorBarPage> with Assets {
   int currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
   
    print('printando o index 1 $currentIndex');
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onItemTapped,
      iconSize: 23,
      items: List.generate(
        items.length,
        (i) {
          print('printando o index 2 $currentIndex');
          return BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label:  items[i].label,
          icon: ImageIcon(
           AssetImage(items[i].icon),
          
            color: Colors.black,
          ),
        );
        }
      ),
    );
  }
  
}
