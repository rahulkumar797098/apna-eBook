import 'package:apna_ebook/colors.dart';
import 'package:apna_ebook/doman/custom_style.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Library" , style: myTextStyle25(),),),
      floatingActionButton: FloatingActionButton(onPressed: (){} , child: Icon(Icons.add), backgroundColor: secondary,),
      body: Center(child: Text("Empty" , style: myTextStyle15(fontColor: Colors.black45),)),
    );
  }
}
