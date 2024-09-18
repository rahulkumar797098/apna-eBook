import 'dart:async';
import 'package:apna_ebook/screen/dash_board_screen.dart';
import 'package:flutter/material.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashBordScreen()));
    });
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Image.asset(
            "assets/icon/ebook.png",
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Apna eBook",
            style: TextStyle(fontSize: 30),
          ),
        ])));
  }
}
