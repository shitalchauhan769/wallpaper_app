import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpaper"),
        bottom: const TabBar(
          tabs: [
            Tab(text: "Home"),
            Tab(text: "Categories"),
            Tab(text: "Premium"),
            Tab(text: "Favorite"),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          CategoryScreen(),
          PremiumScreen(),
          FavoriteScreen()
        ],
      ),
    );
  }
}
