import 'package:get/get.dart';
import 'package:my_beats/controller/song_player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SongDataController extends GetxController {
  final OnAudioQuery  audioQuery = OnAudioQuery();
  bool _hasPermission = false;
  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayingIndex = 0.obs;
  SongPlayerController songPlayerController = Get.put(SongPlayerController());

  @override
  void onInit() {
    super.onInit();
    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    audioQuery.setLogConfig(logConfig);
    checkAndRequestPermissions();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await audioQuery.checkAndRequest(
      retryRequest: retry,
    );
  }

  Future<void> getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  Future<void> storagePermission() async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var re = await Permission.manageExternalStorage.request();
      if (re.isGranted) {
        // getLocalSongs();  // Gọi hàm này nếu quyền đã được cấp
        print("khanh true 1");
      }
      else {
        print("khanh false 1");
      }
    } else {
      var result = await Permission.storage.request();
      if (result.isGranted) {
        // getLocalSongs();  // Gọi hàm này nếu quyền đã được cấp
        print("khanh true 2");
      }
      else {
        print("khanh false 2");
      }
    }
  }

  void findCurrentSongPlayingIndex(songId) {
    localSongList.forEach((e) {
      if (e.id == songId) {
        currentSongPlayingIndex.value = localSongList.indexOf(e);
      }

    });
    print(songId);
    print(currentSongPlayingIndex.value);
  }

  void playNextSong() {
    int songListen = localSongList.length;
    currentSongPlayingIndex.value = currentSongPlayingIndex.value + 1;
    if (currentSongPlayingIndex.value < songListen) {
      SongModel nextSong = localSongList[currentSongPlayingIndex.value];
      songPlayerController.playLocalAudio(nextSong); 
    }
  }
  
  void playPreviousSong() {
    int songListen = localSongList.length;
    if (currentSongPlayingIndex.value != 0) {
      currentSongPlayingIndex.value = currentSongPlayingIndex.value - 1;
      if (currentSongPlayingIndex.value < songListen) {
        SongModel nextSong = localSongList[currentSongPlayingIndex.value];
        songPlayerController.playLocalAudio(nextSong); 
      }
    }
  }
}
