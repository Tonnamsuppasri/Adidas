import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState(); // Create the state class
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController; // TabController to manage the tabs

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Initialize TabController with 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the controller when the widget is destroyed
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search bar placed at the top
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Find products',
                          hintStyle: GoogleFonts.lato(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),

              // TabBar for Women, Kid, Man
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    child: Text(
                      'WOMEN',
                      style: TextStyle(fontSize: 10), // Make the font size smaller
                    ),
                  ),
                  Tab(
                    child: Text(
                      'MAN',
                      style: TextStyle(fontSize: 10), // Make the font size smaller
                    ),
                  ),
                  Tab(
                    child: Text(
                      'KIDS',
                      style: TextStyle(fontSize: 10), // Make the font size smaller
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20), // Space between search bar and image

              // Image displayed below the search bar
              Image.asset(
                'assets/images/promotions.jpg', // The image you added in the assets folder
                width: 400,  // Adjust the width as needed
                height: 200, // Adjust the height as needed
                fit: BoxFit.cover, // Make sure the image fits well within the bounds
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Set the border color
                  borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/shoes.png', // Replace with the correct asset path
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  title: const Text('SHOES'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle tap action
                  },
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Set the border color
                  borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/polo-shirt.png', // Replace with the correct asset path
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  title: const Text('CLOTHING'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle tap action
                  },
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Set the border color
                  borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/hat.png', // Replace with the correct asset path
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  title: const Text('ACCESSORIES'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle tap action
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                  children: [
                    _buildCategoryTile(Icons.percent, "SALE"),
                    _buildCategoryTile(Icons.sports, "SPORT"),
                    _buildCategoryTile(Icons.local_fire_department, "NEW AND TRENDING"),
                    _buildCategoryTile(Icons.card_giftcard, "GIFT CARDS"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCategoryTile(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.black),
          const SizedBox(height: 5),
          Text(title, style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
