import 'package:apna_ebook/colors.dart';
import 'package:apna_ebook/screen/library_screen.dart';
import 'package:apna_ebook/screen/categories_screen.dart';
import 'package:apna_ebook/screen/favourite_screen.dart';
import 'package:apna_ebook/screen/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({super.key});

  @override
  State<DashBordScreen> createState() => _dashBordScreenState();
}

class _dashBordScreenState extends State<DashBordScreen> {
  int _indexValue = 0;

  // list of screen that is to be shown on the tap of each item
  final List<Widget> _screenList = [
    HomeScreen() ,
    CategoriesScreen() ,
    LibraryScreen() ,
    FavouriteScreen() ,


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),      body: _screenList[
      _indexValue], // passing index value so screen will change dynamically
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.orangeAccent,
        color: abColor,
        index: _indexValue, // update index
        onTap: (index) {
          setState(() {
            _indexValue = index; // updating index on each tap
          });
        },

        items: [
          _buildNavItem("assets/icon/open-book.png", "Book"),
          _buildNavItem("assets/icon/menu.png", "Category"),
          _buildNavItem("assets/icon/stack-of-books.png", "Library"),
          _buildNavItem("assets/icon/favorite.png", "Favourite"),

        ],

        backgroundColor: Colors.transparent,

        // speed of animation
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label) {
    return SizedBox(
      width: 45,
      height: 45,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            icon,
            height: 30,
            width: 30,
          ),
          Positioned(
            bottom: 0,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
