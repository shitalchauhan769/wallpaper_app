import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  PageController pageController =
  PageController(viewportFraction: 0.8, keepPage: true);
  HomeProvider? providerW;
  HomeProvider? providerR;
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWallpaperAPI();
  }
  @override
  Widget build(BuildContext context) {
    providerR=context.read<HomeProvider>();
    providerW=context.watch<HomeProvider>();
    return Scaffold(
      // body: Column(
      //   children: [
      //     CarouselSlider.builder(
      //       itemCount: providerW!.imageList.length,
      //       itemBuilder: (context, index, realIndex) {
      //         return Container(
      //           height: 500,
      //           width: MediaQuery.sizeOf(context).width,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: NetworkImage("${providerW!.imageList[index].pageURL}"),
      //                   fit: BoxFit.cover)),
      //         );
      //       },
      //       options: CarouselOptions(
      //         initialPage: 2,
      //         onPageChanged: (index, reason) {
      //           providerR!.changeImage(index);
      //           pageController = PageController(initialPage: index);
      //         },
      //         autoPlay: true,
      //         autoPlayInterval: const Duration(seconds: 3),
      //         enlargeCenterPage: true,
      //         viewportFraction: 0.8,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
