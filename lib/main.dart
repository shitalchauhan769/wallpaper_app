import 'package:flutter/material.dart';
import 'package:wallpapers_app/screen/home/provider/home_provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: HomeProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      routes: app_routes,
      ),),
  );
}
