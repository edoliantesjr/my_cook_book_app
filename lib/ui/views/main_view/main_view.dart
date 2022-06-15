import 'package:flutter/material.dart';
import 'package:my_recipe_app/ui/views/home_view/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        // onTap: (index) => model.changeIndex(index),
        iconSize: 28,
        elevation: 20,
        backgroundColor: Colors.green.shade50,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
        ],
      ),
      body: Container(
        color: Colors.green.withOpacity(0.05),
        child: IndexedStack(
          index: 0,
          children: [
            HomeView(),
          ],
        ),
      ),
    );
  }
}
