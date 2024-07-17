import 'package:flutter/material.dart';

import '../screen/Favorite/view/Favorite_screen.dart';
import '../screen/Premium/view/Premium_screen.dart';
import '../screen/categories/view/category_screen.dart';
import '../screen/dash/view/dash_screen.dart';
import '../screen/home/view/home_screen.dart';
import '../screen/search/view/search_screen.dart';
Map<String,WidgetBuilder>app_routes={
  '/':(context) =>const HomeScreen(),
  'dash':(context) =>const DashScreen(),
  'search':(context) =>const SearchScreen(),
  'premium':(context) => const PremiumScreen(),
  'categories':(context) => const CategoryScreen(),
  'favorite':(context) => const FavoriteScreen(),
};