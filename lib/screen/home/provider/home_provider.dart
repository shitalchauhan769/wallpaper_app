import 'package:flutter/material.dart';
import 'package:wallpapers_app/screen/home/model/wallpapers_model.dart';
import 'package:wallpapers_app/utils/wallpapers_helper.dart';

class HomeProvider with ChangeNotifier {
  Future<WallpaperModel?>? wallpaperModel;
  int isIndex = 0;
  String search = "nature";

  void changeImage(int index) {
    isIndex = index;
    notifyListeners();
  }

  void getWallpaperAPI() {
    WallpaperHelper helper = WallpaperHelper();

    wallpaperModel = helper.WallpaperAPI(search);

    wallpaperModel!.then(
      (value) {
        if (value != null) {
          notifyListeners();
        }
      },
    );
  }
}
