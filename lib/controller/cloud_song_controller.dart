import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_beats/model/my_song_model.dart';

class CloudSongController extends GetxController {
  final db = FirebaseFirestore.instance;
  RxList<MySongModel> cloudSongList = RxList<MySongModel> ();
  RxList<MySongModel> trandingSongList = RxList<MySongModel>([]);

  @override
  void onInit() {
    getCloudSong();
    // TODO: implement onInit
    super.onInit();
  }

  void uploadSongToDB() async {
    MySongModel newSong = MySongModel(
      id: 2,
      title: "To thich cau",
      artist: "hansara",
      album: "aa",
      albumArt: "https://lh3.googleusercontent.com/Ek_tr45F6u3zFArj4s-KUw7gSxi-NHKDxwfGqkiGTCdUiIzs7PtY-6Wno6Uj3lsGJKTkdWKOJM_ZcyiFnJOxGGGiaBufXEdMbQ=w960-rj-l80-nu-e365",
      data: "https://firebasestorage.googleapis.com/v0/b/my-beats-84f9f.appspot.com/o/y2mate.com%20-%20HAN%20SARA%20%20T%E1%BB%9A%20TH%C3%8DCH%20C%E1%BA%ACU%20FT%20HHN%20%20OFFICIAL%20MUSIC%20VIDEO.mp3?alt=media&token=646aff9b-cc35-4f82-9489-0efe72a13dd1"
    );
    
    await db.collection("tranding").add(newSong.toJson());
    print("❤️khanh dap chay");
  }

  void getCloudSong() async {
    cloudSongList.clear();
    await db.collection("songs").get().then((value) {
      value.docs.forEach((element) {
        cloudSongList.add(MySongModel.fromJson(element.data()));
      });
    });
    await db.collection("tranding").get().then((value) {
      value.docs.forEach((element) {
        trandingSongList.add(MySongModel.fromJson(element.data()));
      });
    });
  }
}