import 'package:apna_ebook/doman/custom_style.dart';
import 'package:apna_ebook/screen/audio/science_fiction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

List<Map<String, dynamic>> audio = [
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
];

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3/5,
        ),
        itemCount: audio.length, // Add the itemCount here
        itemBuilder: (context, index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: (){
                  if(audio[index]['title'] == "Science Fiction" ) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ScienceFictionScreen() )) ;
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
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10) , topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(audio[index]['cover']),
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
                              audio[index]['title'],
                              style: myTextStyle20(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              Positioned(
                right: 5,
                bottom: 30,

                  child: Image.asset("assets/icon/play.png" , height: 40, width: 40,))
            ]

          );
        },
      ),
    );
  }
}
