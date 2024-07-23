import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/detall/provider/detail_provider.dart';

import '../../home/model/wallpapers_model.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<HomeProvider>().getWallpaperAPI();
    // if(scrollController.position.pixels == scrollController.position.maxScrollExtent)
    // {  context.read<HomeProvider>().page++;
    //    context.read<HomeProvider>().getWallpaperAPI();
    // }
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: FutureBuilder(
        future: providerW!.wallpaperModel,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            WallpaperModel? model = snapshot.data;
            providerR!.hintList.addAll(model!.hitsList!);
            model.hitsList!.clear();

            if (model == null) {
              return const Center(child: Text("not available"));
            }  else {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'wallpaper');
                },
                child: Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    itemCount: providerR!.hintList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 150,
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

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
