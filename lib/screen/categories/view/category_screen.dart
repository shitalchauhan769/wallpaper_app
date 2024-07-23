import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/categories/provider/categoris_provider.dart';
import 'package:wallpapers_app/screen/detall/provider/detail_provider.dart';

import '../../../utils/globle_screen.dart';
import '../../home/model/wallpapers_model.dart';
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
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(// appBar: AppBar(
      //   actions: const [
      //     // IconButton(
      //     //     onPressed: () {
      //     //       showDialog(
      //     //         context: context,
      //     //         builder: (context) {
      //     //           Random r1 = Random();
      //     //           int i = r1.nextInt(diwaliList.length);
      //     //           return AlertDialog(
      //     //             title: Text("${diwaliList[i].quotes}"),
      //     //           );
      //     //         },
      //     //       );
      //     //     },
      //     //     icon: Icon(Icons.sunny)),
      //     // ElevatedButton(
      //     //     onPressed: () {
      //     //       context.read<CategorisProvider>().changeVie();
      //     //     },
      //     //     child: const Text(
      //     //       "click",
      //     //       style: TextStyle(color: Colors.black, fontSize: 18),
      //     //     )),
      //   ],
      // ),
      body: GridView.builder(
              itemCount: categoris.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // context.read<DetailProvider>().search = providerW!.categoris[index].name!;
                     context.read<HomeProvider>().search = providerW!.categoris[index].name!;
                      providerW!.hintList.clear();
                      Navigator.pushNamed(context, "detail");

                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage("${categoris[index].image}"),
                          fit: BoxFit.cover),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "${categoris[index].name}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )

    );
  }

  Widget Tile(int index) {
    return InkWell(
      onTap: () {
        context.read<DetailProvider>().search =
            providerW!.categoris[index].name!;
        Navigator.pushNamed(context, "detail");
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage("${categoris[index].image}"),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "${categoris[index].name}",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

//Scaffold(
//       // body: Column(
//       //   children: [
//       //     CarouselSlider.builder(
//       //       itemCount: providerW!.imageList.length,
//       //       itemBuilder: (context, index, realIndex) {
//       //         return Container(
//       //           height: 500,
//       //           width: MediaQuery.sizeOf(context).width,
//       //           decoration: BoxDecoration(
//       //               image: DecorationImage(
//       //                   image: NetworkImage("${providerW!.imageList[index].pageURL}"),
//       //                   fit: BoxFit.cover)),
//       //         );
//       //       },
//       //       options: CarouselOptions(
//       //         initialPage: 2,
//       //         onPageChanged: (index, reason) {
//       //           providerR!.changeImage(index);
//       //           pageController = PageController(initialPage: index);
//       //         },
//       //         autoPlay: true,
//       //         autoPlayInterval: const Duration(seconds: 3),
//       //         enlargeCenterPage: true,
//       //         viewportFraction: 0.8,
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );

//InkWell(
//                     onTap: () {
//                       context.read<DetailProvider>().search =
//                       providerW!.categoris[index].name!;
//                       Navigator.pushNamed(context, "detail");
//                     },
//                     child: Tile(index))
