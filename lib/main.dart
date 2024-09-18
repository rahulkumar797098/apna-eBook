import 'package:apna_ebook/screen/audio/science_fiction_screen.dart';
import 'package:apna_ebook/screen/audio_screen.dart';
import 'package:apna_ebook/screen/categories_screen.dart';
import 'package:apna_ebook/screen/dash_board_screen.dart';
import 'package:apna_ebook/screen/home_screen.dart';
import 'package:apna_ebook/screen/library_screen.dart';
import 'package:apna_ebook/screen/player_screen.dart';
import 'package:apna_ebook/screen/splace_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplaceScreen() );


  }
}

