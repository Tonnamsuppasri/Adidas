import 'package:adidas/adiclub_screen.dart';
import 'package:adidas/favorite_screen.dart';
import 'package:adidas/search_screen.dart';
import 'package:adidas/shopping_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final Map<int, Map<String, Widget>> _navigationMap = {
    0: {
      "title": const Text("Home"),
      "screen": Container()
    }, // ใช้ Container() แทน HomeScreen()
    1: {"title": const Text("Search"), "screen": SearchScreen()},
    2: {"title": const Text("Favorites"), "screen": FavoriteScreen()},
    3: {"title": const Text("Cart"), "screen": ShoppingScreen()},
    4: {"title": const Text("AdiClub"), "screen": AdiclubScreen()},
  };

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "SHOP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          backgroundColor: Colors.white, // Set AppBar background color to white
          iconTheme: const IconThemeData(
              color: Colors.black), // Set icon color to black
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person,
                  color: Colors.black), // Set icon color to black
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children:
              _navigationMap.values.map((page) => page["screen"]!).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/logo.png", width: 30, height: 30),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/adiclub.png",
                  width: 45, height: 45),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
