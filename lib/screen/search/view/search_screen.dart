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

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWallpaperAPI();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    TextEditingController searchText = TextEditingController();
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
              if (model == null) {
                return const Center(child: Text("not avalabel"));
              }
              else if (model.hitsList!.isEmpty) {
                return const Center(child: Text("search another topic"));
              }
              else {
                return Column(
                  children: [
                    SearchBar(
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
                      // onTap: () {
                      //   providerW!.search = searchText.text;
                      //   providerR!.getWallpaperAPI();
                      // },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: model.hitsList!.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 200,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: "${model.hitsList![index].previewURL}",
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

