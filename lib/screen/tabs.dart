import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/categories-screen.dart';
import 'package:flutter_application_1/screen/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
int _selectedPageIndex = 0;
var activePageTittle = 'Categories';
void _selectedPage(int index){
  setState(() {
    _selectedPageIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoriesScreen();
    if(_selectedPageIndex == 1 ){
      activeScreen = const MealsScreen(title: 'Favorites', meals: []);
      activePageTittle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(title:  Text(activePageTittle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label:'Categories' ),
          BottomNavigationBarItem(icon:Icon(Icons.star) ,label:'Favorites' ),
        ],
        onTap: _selectedPage,
      ),
    );
  }
}
