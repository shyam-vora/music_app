import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find your',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        'Music',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container())
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SearchBar(
                leading: Icon(Icons.search),
              ),
            ),
            MusicList()
          ],
        ),
      ),
    );
  }
}

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List song = [
    {
      "thumbnail": "https://pbs.twimg.com/media/FiIX5JkaAAELRhL.jpg",
      "path": "songes/श्र_हनुमानचालीसा.mp3",
      "artist": "jemish bhagat",
      "genre": "Bhajan"
    },
    {
      "thumbnail":
          "https://c.saavncdn.com/006/Bhoot-Part-One-The-Haunted-Ship-Hindi-2020-20200212161346-500x500.jpg",
      "path": "songes/Channa Ve.mp3",
      "artist": "Vicky Kaushal",
      "genre": "Romance"
    },
    {
      "thumbnail":
          "https://i.scdn.co/image/ab6761610000e5ebd0bc4850fcd11d041429fdc6",
      "path": "songes/VhalamAavoNe_.mp3",
      "artist": "Geet Rabari",
      "genre": "Lockgeet"
    },
    {
      "thumbnail": "https://i.ytimg.com/vi/KUpwupYj_tY/maxresdefault.jpg",
      "path": "songes/Tere Hawaale.mp3",
      "artist": "Arjit, Shilpa",
      "genre": "Love"
    },
    {
      "thumbnail": "https://pbs.twimg.com/media/FiIX5JkaAAELRhL.jpg",
      "path": "songes/श्र_हनुमानचालीसा.mp3",
      "artist": "jemish bhagat",
      "genre": "Bhajan"
    },
    {
      "thumbnail":
          "https://c.saavncdn.com/006/Bhoot-Part-One-The-Haunted-Ship-Hindi-2020-20200212161346-500x500.jpg",
      "path": "songes/Channa Ve.mp3",
      "artist": "Vicky Kaushal",
      "genre": "Romance"
    },
    {
      "thumbnail":
          "https://i.scdn.co/image/ab6761610000e5ebd0bc4850fcd11d041429fdc6",
      "path": "songes/VhalamAavoNe_.mp3",
      "artist": "Geet Rabari",
      "genre": "Lockgeet"
    },
    {
      "thumbnail": "https://i.ytimg.com/vi/KUpwupYj_tY/maxresdefault.jpg",
      "path": "songes/Tere Hawaale.mp3",
      "artist": "Arjit, Shilpa",
      "genre": "Love"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Song List GridView
        Container(
          height: MediaQuery.of(context).size.height * 0.56,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: song.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70),
                  child: Row(
                    children: [
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Container(
                        height: 120,
                        width: 100,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(song[index]['thumbnail']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Song Details
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song[index]['genre'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 15, 13, 13)),
                              ),
                              Text(
                                song[index]['artist'],
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
