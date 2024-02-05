import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/config/color.dart';
import 'package:my_beats/controller/song_player_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongAndVolume extends StatefulWidget {
  const SongAndVolume({super.key});

  @override
  State<SongAndVolume> createState() => _SongDetailState();
}

class _SongDetailState extends State<SongAndVolume> {
  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Obx(() => SfRadialGauge(
          animationDuration: 1,
          enableLoadingAnimation: true,
          axes: [
            RadialAxis(
              useRangeColorForAxis: true,
              startAngle: 0,
              endAngle: 180,
              canRotateLabels: false,
              interval: 10,
              isInversed: true,
              maximum: 1,
              minimum: 0,
              showAxisLine: true,
              showLabels: false,
              showTicks: true,
              ranges: [
                GaugeRange(
                  startValue: 0,
                  endValue: songPlayerController.volumLavel.value,
                  color: Colors.red
                )
              ],
              pointers: [
                MarkerPointer(
                  color: primaryColor,
                  value: songPlayerController.volumLavel.value,
                  onValueChanged: (value) {
                    songPlayerController.changeVolume(value);
                  },
                  enableAnimation: true,
                  enableDragging: true,
                  markerType: MarkerType.circle,
                  markerWidth: 20,
                  markerHeight: 20,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  horizontalAlignment: GaugeAlignment.center,
                  widget: songPlayerController.isCloudSoundPlaying.value ? Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      image: DecorationImage(
                          image: NetworkImage(songPlayerController.albumUrl.value),
                          fit: BoxFit.cover),
                      color: divColor,
                    ),
                  ) : Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      image: DecorationImage(
                          image: AssetImage("assets/icons/icon_2.jpg"),
                          fit: BoxFit.cover),
                      color: divColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
