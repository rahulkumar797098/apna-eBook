import 'package:apna_ebook/colors.dart';
import 'package:apna_ebook/doman/custom_style.dart';
import 'package:apna_ebook/screen/pdf_view_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GitaScreen extends StatefulWidget {

  const GitaScreen({super.key});

  @override
  State<GitaScreen> createState() => _GitaScreenState();
}

class _GitaScreenState extends State<GitaScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// get pdf
  Stream<List<Map<String, dynamic>>> getChapters() {
    return _firestore
        .collection('Bhagavad_Gita') // Collection name
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'lesson': doc['Lesson'],
          'pdf_path': doc['pdf_link'],
        };
      }).toList();
    });
  }

  /// get download
  Future<String> getDownloadURL(String path) async {
    try {
      final ref = _storage.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error getting download URL for $path: $e');
      throw 'Failed to get download URL';
    }
  }

  /// pdf open and Navigate to other screen
  void openPDF(String path) async {
    try {
      final url = await getDownloadURL(path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewerScreen(url: url),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error opening PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: abColor,
        leading: const Icon(Icons.menu),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
        ),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: getChapters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No chapters available.'));
          }

          final chapters = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3/5,

            ),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];
              return GestureDetector(
                onTap: () {
                  openPDF(chapter['pdf_path']);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                         // You can adjust this
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/image/gita.jpg"),
                                fit: BoxFit.cover, // Ensures the image covers the container properly
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Text(
                          'Lesson ${chapter['lesson']}',
                          style:myTextStyle20(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
