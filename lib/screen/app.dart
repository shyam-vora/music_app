import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sopify/modual/music.dart';
import 'package:sopify/screen/home.dart';
import 'package:sopify/screen/serach.dart';
import 'package:sopify/screen/yourlib.dart';

AudioPlayer audioPlayer = AudioPlayer();
bool isPlaying = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isPlaying = false;
  var tabs = [];
  int currentTabIndex = 0;
  Music? music;

  Widget createminiplayer(Music? music) {
    this.music = music;
    setState(() {});
    if (music == null) {
      return SizedBox();
    }

    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
            onPressed: () async {
              if (!isPlaying) {
                setState(() {
                  isPlaying = true;
                });
                if (music.audioURL != null) {
                  try {
                    print('Playing: ${music.audioURL}');
                    await audioPlayer.play(music.audioURL);
                  } catch (e) {
                    print('Error: $e');
                  }
                } else {
                  print('Invalid URL.');
                }
              } else {
                await audioPlayer.stop();
                setState(() {});
                isPlaying = false;
              }
            },
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabs = [Home(createminiplayer), Search(), Yourlib()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          createminiplayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              setState(() {
                currentTabIndex = currentIndex;
              });
            },
            backgroundColor: Color.fromARGB(66, 109, 107, 107),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Library',
              ),
            ],
          ),
        ],
      ),
    );
  }
  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }
}
