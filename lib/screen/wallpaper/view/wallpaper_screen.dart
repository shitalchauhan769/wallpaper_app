import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  PageController pageController =
  PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    providerR=context.read<HomeProvider>();
    providerW=context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
         title: const Text("Wallpaper"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: providerW!.hintList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  // width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      // boxShadow: const [
                      //   BoxShadow(color: Colors.black,blurStyle: BlurStyle.normal,spreadRadius: 0,offset: Offset.zero)
                      // ],
                      image: DecorationImage(
                          image: NetworkImage(
                              providerW!.hintList[index].previewURL!),
                          fit: BoxFit.cover)),
                );
              },
              options: CarouselOptions(
                initialPage: 3,
                height: 650,
                onPageChanged: (index, reason) {
                  providerR!.changeImage(index);
                  pageController = PageController(initialPage: index);
                },
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
