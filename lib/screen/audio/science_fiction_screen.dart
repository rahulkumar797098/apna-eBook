import 'package:apna_ebook/doman/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../player_screen.dart';
// Import the PlayerScreen

class ScienceFictionScreen extends StatefulWidget {
  const ScienceFictionScreen({super.key});

  @override
  State<ScienceFictionScreen> createState() => _ScienceFictionScreenState();
}

class _ScienceFictionScreenState extends State<ScienceFictionScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<List<Map<String, dynamic>>> fetchAudioFiles() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('science_audio').get();
    List<Map<String, dynamic>> audioFiles =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    return audioFiles;
  }

  Future<String> getDownloadUrl(String gsUrl) async {
    final ref = firebase_storage.FirebaseStorage.instance.refFromURL(gsUrl);
    return await ref.getDownloadURL();
  }

  void _navigateToPlayerScreen(Map<String, dynamic> audioItem) async {
    String? audioPath = audioItem['audio_path'];
    String downloadUrl = audioPath ?? '';

    if (audioPath != null && audioPath.startsWith('gs://')) {
      downloadUrl = await getDownloadUrl(audioPath);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayerScreen(
          audioPath: downloadUrl,
          title: audioItem['title'],
          poster: audioItem['poster'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Science Fiction Audio Files'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAudioFiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching audio files.'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No audio files available.'));
          }

          List<Map<String, dynamic>> audioFiles = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: audioFiles.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> audioItem = audioFiles[index];
              String? audioPath = audioItem['audio_path'];

              return Stack(
                children: [
                  GestureDetector(
                    onTap: () => _navigateToPlayerScreen(audioItem),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: Image.network(
                                audioItem['poster'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text(
                                      'Poster not available',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  );
                                },
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              audioItem['title'],
                              textAlign: TextAlign.center,
                              style: myTextStyle20(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 5,
                      child: Image.asset(
                        "assets/icon/play.png",
                        height: 40,
                        width: 40,
                      )),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
