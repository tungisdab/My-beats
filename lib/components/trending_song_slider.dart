import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_beats/config/color.dart';

class TrendingSongSlider extends StatefulWidget {
  const TrendingSongSlider({super.key});

  @override
  State<TrendingSongSlider> createState() => _TrendingSongSliderState();
}

class _TrendingSongSliderState extends State<TrendingSongSlider> {
  @override
  Widget build(BuildContext context) {

    List<Widget> sliderItems = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/ig.png"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
          color: divColor
        ),
      )
    ];
    return CarouselSlider(
      items: sliderItems,
      options: CarouselOptions( 
          height: 350,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (value, items){},
          scrollDirection: Axis.horizontal,
      )
    );
  }
}
