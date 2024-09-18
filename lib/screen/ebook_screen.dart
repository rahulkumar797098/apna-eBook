import 'package:apna_ebook/colors.dart';
import 'package:apna_ebook/doman/custom_style.dart';
import 'package:apna_ebook/screen/local_pdf_full_screen.dart';
import 'package:flutter/material.dart';

class EbookScreen extends StatefulWidget {
  const EbookScreen({super.key});

  @override
  State<EbookScreen> createState() => _EbookScreenState();
}

List<Map<String, dynamic>> topPdf = [
  {
    "title": "Healing-Her-Heart",
    "banner": "assets/icon/LauraScott_HealingHerHeart_2500.jpg",
    "pdf": "assets/top_trending_pdf/Healing-Her-Heart.pdf" ,
    "payment" : "Free" ,
    "rating" : "★★★★☆"
  },
  {
    "title": "River bones",
    "banner": "assets/icon/A1iDsBqbhhL._SL1500_.jpg",
    "pdf": "assets/top_trending_pdf/River-Bones.pdf",
    "payment" : "Free" ,
    "rating" : "★★★☆☆"
  },
  {
    "title": "The demon gir",
    "banner": "assets/icon/cover-orig-29439.jpg",
    "pdf": "assets/top_trending_pdf/The-Demon-Girl.pdf" ,
    "payment" : "Free" ,
    "rating" : "★★★★☆"
  },
];
List<Map<String, dynamic>> author = [
  {
    "title": "Arundhati Roy",
    "banner": "assets/author/Arundhati.jpeg",

  },
  {
    "title": "Bhavik Sarkhedi",
    "banner": "assets/author/Bhavik Sarkhedi.jpg",

  },
  {
    "title": "Salman Rushdie",
    "banner": "assets/author/Salman Rushdie.jpeg",
  },

  {
    "title": "  Rabindranath Tagore",
    "banner": "assets/author/rabindar nath.jpeg",
  },


];
List<Map<String, dynamic>> rec = [
  {
    "title": "indian constitution",
    "banner": "assets/image/Constitution_of_India.png",
    "pdf": "assets/recommendation/indian co.pdf" ,
    "payment" : "Free" ,
    "rating" : "★★★★☆"
  },
  {
    "title": "Ultimate Survival",
    "banner": "assets/image/Ultimate Survival.jpg",
    "pdf": "assets/recommendation/Ultimate Survival Skills Guide.pdf" ,
    "payment" : "Free" ,
    "rating" : "★★★★☆"
  },
  {
    "title": "Self-Love",
    "banner": "assets/image/Self-Love.jpg",
    "pdf": "assets/recommendation/Self-Love Guide.pdf",
    "payment" : "Free" ,
    "rating" : "★★★☆☆"
  },
  {
    "title": "Time Management",
    "banner": "assets/image/Time Management.jpg",
    "pdf": "assets/recommendation/Time Management.pdf" ,
    "payment" : "Free" ,
    "rating" : "★★★★☆"
  },

];

class _EbookScreenState extends State<EbookScreen> {
  MediaQueryData? mqData ;
  @override

  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Trending",
                    style: myTextStyle30(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: myTextStyle20(
                        fontFamily: "fontSecond", fontColor: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:mqData!.size.height*0.41,
              child: ListView.builder(
                itemCount: topPdf.length,
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemBuilder: (context, index) {
                  final pdf = topPdf[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to LocalPdfFullScreen on tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LocalPdfFullScreen(assetPath: pdf['pdf']),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: mqData!.size.width*0.5,
                      child: Card(
                        margin: EdgeInsets.all(8),
                        shadowColor: secondary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 240, // Add fixed height
                              width: double.infinity, // Full width
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(pdf['banner']),
                                  fit: BoxFit.cover, // Ensures image covers the container
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Display the title below the image
                            Padding(
                              padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                pdf['title' ],
                                style: myTextStyle15(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(pdf['payment'] , style: myTextStyle20(fontColor: Colors.green),),
                                  Text(pdf['rating'] , style: myTextStyle20(fontColor: Colors.orangeAccent),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Author",
                    style: myTextStyle30(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: myTextStyle20(
                        fontFamily: "fontSecond", fontColor: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:mqData!.size.height*0.2,
              child: ListView.builder(
                itemCount: author.length,
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemBuilder: (context, index) {
                  final auth = author[index];
                  return SizedBox(
                    width: mqData!.size.width*0.4,
                    child: Card(
                      margin: EdgeInsets.all(8),
                      shadowColor: secondary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100, // Full width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage(auth['banner']),
                                fit: BoxFit.cover, // Ensures image covers the container
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Display the title below the image
                          Padding(
                            padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              auth['title' ],
                              style: myTextStyle15(),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: myTextStyle30(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: myTextStyle20(
                        fontFamily: "fontSecond", fontColor: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:mqData!.size.height*0.41,
              child: ListView.builder(
                itemCount: rec.length,
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemBuilder: (context, index) {
                  final recPdf = rec[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to LocalPdfFullScreen on tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LocalPdfFullScreen(assetPath: recPdf['pdf']),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: mqData!.size.width*0.5,
                      child: Card(
                        margin: EdgeInsets.all(8),
                        shadowColor: secondary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 240, // Add fixed height
                              width: double.infinity, // Full width
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(recPdf['banner']),
                                  fit: BoxFit.cover, // Ensures image covers the container
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Display the title below the image
                            Padding(
                              padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                recPdf['title' ],
                                style: myTextStyle15(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(recPdf['payment'] , style: myTextStyle20(fontColor: Colors.green),),
                                  Text(recPdf['rating'] , style: myTextStyle20(fontColor: Colors.orangeAccent),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
