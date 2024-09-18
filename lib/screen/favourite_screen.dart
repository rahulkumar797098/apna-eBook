import 'package:apna_ebook/doman/custom_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favoutite Book" , style: myTextStyle20(),),),
      body: Center(child: Text("Add Favourite Books" , style: myTextStyle15(),),),
    );
  }
}
