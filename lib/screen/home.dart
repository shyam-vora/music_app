import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sopify/modual/category.dart';
import 'package:sopify/modual/music.dart';
import 'package:sopify/screen/app.dart';
import 'package:sopify/screen/settings.dart';
import 'package:sopify/service/category_oparation.dart';
import 'package:sopify/service/music_oparation.dart';

class Home extends StatefulWidget {
  // const Home({super.key});
  Function _miniplayer;
  Home(this._miniplayer);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  Widget createCategory(CategoryClass category) {
    return Container(
      color: Colors.blueGrey.shade300,
      child: Row(
        children: [
          Image.network(
            category.imageURL,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10).copyWith(right: 5, left: 5),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  if (favoutiteList.contains(category)) {
                    favoutiteList.remove(category);
                  } else {
                    favoutiteList.add(category);
                  }
                });
                print(favoutiteList.length);
              },
              child: Icon(favoutiteList.contains(category)
                  ? Icons.favorite
                  : Icons.favorite_outline))
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<CategoryClass> categoryList = categoryoperation.getCategory();
    List<Widget> categories = categoryList
        .map((CategoryClass category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            width: 170,
            child: InkWell(
              onTap: () async {
                await audioPlayer.stop();
                isPlaying = false;
                widget._miniplayer(music);
                await audioPlayer.play(music.audioURL);
                isPlaying = true;
                setState(() {});
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            music.description,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> Musiclist = MusicOperations.getMusic();

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            // Return the widget here
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(Musiclist[index]);
              },
              itemCount: Musiclist.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 270,
      child: GridView.count(
        children: createListOfCategories(),
        crossAxisCount: 2,
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  Widget createAppBar(BuildContext context, String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(right: 15, top: 15),
        child: Text(message),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              createAppBar(context, 'Good morning'),
              SizedBox(
                height: 5,
              ),
              createGrid(),
              createMusicList('Music for you'),
              createMusicList('Popular Playlist')
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade300, Colors.black, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
