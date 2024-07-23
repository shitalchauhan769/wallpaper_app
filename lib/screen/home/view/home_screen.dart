import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/dash/view/dash_screen.dart';

import '../../Favorite/view/Favorite_screen.dart';
import '../../Premium/view/Premium_screen.dart';
import '../../categories/view/category_screen.dart';
import '../provider/home_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  GlobalKey defultTAbController=GlobalKey();

  @override
  Widget build(BuildContext context) {
    providerW=context.watch<HomeProvider>();
    providerR=context.read<HomeProvider>();
    return DefaultTabController(
      key: defultTAbController,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Wallpaper"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:IconButton(onPressed: () {

                Navigator.pushNamed(context, "search");

              }, icon:  const Icon(Icons.search),)
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("Light"),
                  onTap: () {
                    providerR!.setTheme("Light");
                  },
                ),
                PopupMenuItem(
                  child: const Text("Dark"),
                  onTap: () {
                    providerR!.setTheme("Dark");
                  },
                ),
                PopupMenuItem(
                  child: const Text("System"),
                  onTap: () {
                    providerR!.setTheme("System");
                  },
                ),
              ],
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Categories"),
              Tab(text: "Premium"),

            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DashScreen(),
            CategoryScreen(),
            PremiumScreen(),

          ],
        ),

      ),
    );
  }
}

//// drawer:Drawer(
//           //   child: Column(
//           //     children: [
//           //       Row(
//           //         children: [
//           //           Container(
//           //             height: 100,
//           //             width: 100,
//           //             decoration: BoxDecoration(
//           //               borderRadius: BorderRadius.circular(10),
//           //             ),
//           //             child: const Column(
//           //               children: [
//           //                 Text("Dark"),
//           //               ],
//           //             ),
//           //           )
//           //         ],
//           //       )
//           //     ],
//           //   ),
//           // )
