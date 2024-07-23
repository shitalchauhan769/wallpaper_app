import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/screen/categories/provider/categoris_provider.dart';
import 'package:wallpapers_app/screen/detall/provider/detail_provider.dart';
import 'package:wallpapers_app/screen/home/provider/home_provider.dart';
import 'package:wallpapers_app/utils/app_routes.dart';
import 'package:wallpapers_app/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: CategorisProvider()),
        ChangeNotifierProvider.value(value: DetailProvider()),
      ],
      child: Consumer<HomeProvider>(builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:value.theme =="Ligth"
            ?ThemeMode.light
            :value.theme=="Dark"
            ?ThemeMode.dark
            :ThemeMode.system,
        routes: app_routes,
      )
      ),
    ),
  );
}
