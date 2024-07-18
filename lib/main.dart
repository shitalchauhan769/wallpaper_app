import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/categories/provider/categoris_provider.dart';
import 'package:wallpapers_app/screen/home/provider/home_provider.dart';
import 'package:wallpapers_app/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: CategorisProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
    ),
  );
}
