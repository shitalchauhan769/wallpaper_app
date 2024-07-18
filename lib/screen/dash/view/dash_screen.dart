import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/wallpapers_model.dart';
import '../../home/provider/home_provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  ScrollController  scrollController=ScrollController();


  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWallpaperAPI();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent)
        {
          context.read<HomeProvider>().getWallpaperAPI();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: providerW!.wallpaperModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return  Center(child: Text("${snapshot.error}"));
            }
            else if (snapshot.hasData) {
              WallpaperModel? model = snapshot.data;
              providerR!.hintList.addAll(model!.hitsList!);
              model.hitsList!.clear();


              if (model == null) {
                return const Center(child: Text("not available"));
              }
              else if (providerR!.hintList.isEmpty) {
                return const Center(child: Text("search another topic"));
              }
              else {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'wallpaper');
                  },
                  child: Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: providerR!.hintList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: "${providerR!.hintList[index].previewURL}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(
                            child: Image(
                              image: AssetImage("assets/image/placeholder.png"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }

            }

            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
