import 'package:adidas/adiclub_screen.dart';
import 'package:adidas/favorite_screen.dart';
import 'package:adidas/search_screen.dart';
import 'package:adidas/shopping_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("SHOP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          )
        ],
      ),
    ));
  }
}
int _selectedIndex = 0;

final Map<int, Map<String, Widget>> _navigationMap = {
  0: {"title" : const Text("Home"), "screen": HomeScreen()},
  1: {"title" : const Text("Search"), "screen": SearchScreen()},
  2: {"title" : const Text("Favorites"), "screen": FavoriteScreen()},
  3: {"title" : const Text("Cart"), "screen": ShoppingScreen()},
  4: {"title" : const Text("AdiClub"), "screen": AdiclubScreen()},
};