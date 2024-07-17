import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/home/provider/home_provider.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
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
    );
  }
}
