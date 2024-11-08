import 'package:audioplayers/audioplayers.dart';

class Music {
   String name;
   String image;
   String description;
   UrlSource audioURL; 

  Music({
    required this.name,
    required this.image,
    required this.description,
    required this.audioURL,
  });
}
