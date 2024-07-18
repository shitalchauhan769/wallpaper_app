import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/home/model/wallpapers_model.dart';

import '../../home/provider/home_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  ScrollController  scrollController=ScrollController();
  TextEditingController searchText = TextEditingController();


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
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
        actions: [],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: providerW!.wallpaperModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            else if (snapshot.hasData) {
              WallpaperModel? model = snapshot.data;
              providerR!.hintList.addAll(model!.hitsList!);
              model.hitsList!.clear();
              if (providerR!.hintList ==null) {
                return const Center(child: Text("not avalabel"));
              }
              else if (providerR!.hintList.isEmpty) {
                return const Center(child: Text("search another topic"));
              }
              else {
                return Column(
                  children: [
                    SearchBar(
                      hintText: "Search",
                      controller: searchText,

                      onSubmitted: (value) {
                        providerW!.search = searchText.text;
                        providerR!.getWallpaperAPI();
                      },
                      trailing: <Widget>[
                        IconButton(
                            onPressed: () {
                              providerW!.search = searchText.text;
                              providerR!.getWallpaperAPI();
                            },
                            icon: const Icon(Icons.search),),
                      ],

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: providerR!.hintList.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 200,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: "${providerR!.hintList[index].previewURL}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(
                              child: Image(
                                image:
                                AssetImage("assets/image/placeholder.png"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

