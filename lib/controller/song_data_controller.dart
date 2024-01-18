import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongDataController extends GetxController {
  final audioQuery = OnAudioQuery();
  RxList<SongModel> localSongList = <SongModel>[].obs;

   void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );

    print(localSongList.value);
  }
}