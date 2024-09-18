import 'package:flutter/material.dart';
import 'package:apna_ebook/screen/audio_screen.dart';
import 'package:apna_ebook/screen/ebook_screen.dart';

import '../colors.dart';
import '../doman/custom_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
int _indexValue = 0;
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: abColor,
          actions: [
            Image.asset(
              "assets/icon/profile.png",
              height: 40,
            ),
          ],
          title:  Text('Apna eBook' , style: myTextStyle25()),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: abColor, // Set a background color for the header
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/icon/ebook.png", // Add your image path here
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Apna eBook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Navigate to Home screen
                  Navigator.pop(context); // Close drawer after tapping
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Categories'),
                onTap: () {
                  // Navigate to Categories screen
                  Navigator.pop(context); // Close drawer after tapping
                },
              ),
              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Library'),
                onTap: () {
                  // Navigate to Library screen
                  Navigator.pop(context); // Close drawer after tapping
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favourite'),
                onTap: () {
                  // Navigate to Favourites screen
                  Navigator.pop(context); // Close drawer after tapping
                },
              ),
              const Divider(), // A horizontal line between items
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Navigate to Settings screen
                  Navigator.pop(context); // Close drawer after tapping
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Handle logout functionality
                  Navigator.pop(context); // Close drawer after tapping
                },
              ),
            ],
          ),
        ),

        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8), // Rounded corners for the box
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: abColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: Colors.white, // Active tab text color
                unselectedLabelColor: Colors.black,


                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Increased width
                      child:  Text('Ebook' , style:TextStyle(fontSize: 20 , fontFamily: "fontFirst"),),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Increased width
                      child:  Text('Audio' , style:TextStyle(fontSize: 20 , fontFamily: "fontFirst")),
                    ),
                  ),
                ],

              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  EbookScreen(),
                  AudioScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
