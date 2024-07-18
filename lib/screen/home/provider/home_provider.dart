import 'package:flutter/material.dart';
import 'package:wallpapers_app/screen/home/model/wallpapers_model.dart';
import 'package:wallpapers_app/utils/wallpapers_helper.dart';

class HomeProvider with ChangeNotifier {
  Future<WallpaperModel?>? wallpaperModel;
  int isIndex = 0;
  String search = "nature";
  List<HitsModel>hintList=[];
  int page=0;

  void changeImage(int index) {
    isIndex = index;
    notifyListeners();
  }

  void getWallpaperAPI() {
    page++;
    WallpaperHelper helper = WallpaperHelper();

    wallpaperModel = helper.WallpaperAPI(search,page);

    wallpaperModel!.then(
      (value) {
        if (value != null) {
          notifyListeners();
        }
      },
    );
  }
}
