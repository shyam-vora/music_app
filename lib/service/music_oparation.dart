import 'package:audioplayers/audioplayers.dart';
import 'package:sopify/modual/music.dart';

class MusicOperations {
  MusicOperations._() {}

  static List<Music> getMusic() {
    return <Music>[
      Music(
        name: 'Toffan',
        image:
            'https://a10.gaanacdn.com/gn_img/albums/01A3mar3NQ/A3mozBXabN/size_l.webp',
        description: 'Dekho Toffan aaya hai',
        audioURL: UrlSource(
            'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
      ),
      Music(
        name: 'Toffan',
        image:
            'https://a10.gaanacdn.com/gn_img/albums/w4MKPObojg/w4MKPObojg/size_l_1718006614.webp',
        description: 'Dekho Toffan aaya hai',
        audioURL: UrlSource(
            'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/1f/5b/a5/1f5ba5a3-8d1e-4390-d08d-e0f3122349d0/mzaf_12528384564031962417.plus.aac.p.m4a'),
      ),
      Music(
        name: 'Toffan',
        image:
            'https://a10.gaanacdn.com/gn_img/albums/NOXWVRgWkq/OXWVENRw3k/size_l.webp',
        description: 'Dekho Toffan aaya hai',
        audioURL: UrlSource(
            'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/9f/50/9d/9f509dab-4fc8-e761-21fd-63ee6d7948b0/mzaf_15478495451126525488.plus.aac.p.m4a'),
      ),
      Music(
        name: 'Toffan',
        image:
            'https://a10.gaanacdn.com/gn_img/artists/R7vKX6WmrP/R7vKX6WmrP/size_l_1716815964.webp',
        description: 'Dekho Toffan aaya hai',
        audioURL: UrlSource(
            'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/35/7d/05/357d05ec-bb7f-1d9f-1579-36f6bbfce316/mzaf_8356704332065571504.plus.aac.p.m4a'),
      ),
    ];
  }
}
