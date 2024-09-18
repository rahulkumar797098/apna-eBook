import 'package:apna_ebook/colors.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

class PlayerScreen extends StatefulWidget {
  final String audioPath;
  final String title;
  final String poster;

  const PlayerScreen({
    required this.audioPath,
    required this.title,
    required this.poster,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isPlaying = false;
  IconData playBtn = Icons.play_circle_fill_rounded;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    await player.setSourceUrl(widget.audioPath);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _playPause() {
    if (isPlaying) {
      player.pause();
      setState(() {
        playBtn = Icons.play_circle_fill_rounded;
        isPlaying = false;
      });
    } else {
      player.resume();
      setState(() {
        playBtn = Icons.pause_circle_filled_rounded;
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Center(child: Lottie.asset("assets/animations/playerAnim.json")),
                    Center(
                      child: Opacity(
                        opacity: 0.8, // Adjust the opacity value between 0.0 (fully transparent) and 1.0 (fully opaque)
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            image: DecorationImage(
                              image: NetworkImage(widget.poster),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(widget.title,
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icon/repeat.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icon/list-text.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icon/love.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icon/suffle.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                      slider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                              size: 70,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: _playPause,
                            icon: Icon(
                              playBtn,
                              size: 70,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_next_rounded,
                              size: 70,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
      activeColor: Colors.blue,
      min: 0,
      max: 100,
      inactiveColor: Colors.white30,
      value: 20,
      onChanged: (double value) {},
    );
  }
}
