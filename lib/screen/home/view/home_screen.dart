import 'package:flutter/material.dart';
import 'package:wallpapers_app/screen/dash/view/dash_screen.dart';

import '../../Favorite/view/Favorite_screen.dart';
import '../../Premium/view/Premium_screen.dart';
import '../../categories/view/category_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey defultTAbController=GlobalKey();

  @override
  Widget build(BuildContext context) {
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
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Categories"),
              Tab(text: "Premium"),
              Tab(text: "Favorite"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DashScreen(),
            CategoryScreen(),
            PremiumScreen(),
            FavoriteScreen()
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
