import 'package:flutter/material.dart';
import 'package:trizi/view/mobile/pages/search/search_page.dart';
    
class SearchView extends StatelessWidget {

  const SearchView({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              SearchPage(),
              Divider()
            ],
          ),
      ),
    );
  }
}