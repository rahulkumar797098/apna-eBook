import 'package:apna_ebook/screen/hindu_screen/gita_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../doman/custom_style.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

List<Map<String, dynamic>> cat = [
  {
    "title": "Religious",
    "cover": "assets/image/gita.jpg",
  },
  {
    "title": "Mystery",
    "cover": "assets/image/mystry.jpg",
  },
  {
    "title": "Science Fiction",
    "cover": "assets/image/science.jpg",
  },
  {
    "title": "Romance",
    "cover": "assets/image/romance.jpg",
  },
  {
    "title": "Historical Fiction",
    "cover": "assets/image/Historical.jpg",
  },
  {
    "title": "Horror",
    "cover": "assets/image/Horror.jpg",
  },
  {
    "title": "Biography",
    "cover": "assets/image/Biography.jpg",
  },
  {
    "title": "Fantasy",
    "cover": "assets/image/fantasy.jpg",
  },
  {
    "title": "Thriller",
    "cover": "assets/image/thriller.jpg",
  },
  {
    "title": "Self-Help",
    "cover": "assets/image/self_help.jpg",
  },
  {
    "title": "Adventure",
    "cover": "assets/image/adventure.jpg",
  },
  {
    "title": "Poetry",
    "cover": "assets/image/poetry.jpg",
  },
  {
    "title": "Drama",
    "cover": "assets/image/drama.jpg",
  },
  {
    "title": "Humor",
    "cover": "assets/image/humor.jpg",
  },
  {
    "title": "Travel",
    "cover": "assets/image/travel.jpg",
  },
  {
    "title": "Cookbooks",
    "cover": "assets/image/cookbooks.jpg",
  },
  {
    "title": "Philosophy",
    "cover": "assets/image/philosophy.jpg",
  },
  {
    "title": "Non-Fiction",
    "cover": "assets/image/non_fiction.jpg",
  },
  {
    "title": "Graphic Novels",
    "cover": "assets/image/graphic_novels.jpg",
  },
  {
    "title": "Religion",
    "cover": "assets/image/religion.jpg",
  },
];

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: GridView.builder(
          itemCount: cat.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 5,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (cat[index]['title'] == "Religious") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GitaScreen()));
                }
              },
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(cat[index]['cover']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cat[index]['title'],
                            style: myTextStyle20(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
