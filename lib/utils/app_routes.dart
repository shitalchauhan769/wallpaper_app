import 'package:flutter/material.dart';
Map<String,WidgetBuilder>app_routes={
  '/':(context) =>HomeScreen(),
  'categories':(context) => CategoryScreen(),
  'premium':(context) => PremiumScreen(),
  'favorite':(context) => FavoriteScreen(),
};