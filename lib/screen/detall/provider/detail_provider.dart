import 'package:flutter/cupertino.dart';

import '../../../utils/wallpapers_helper.dart';
import '../../home/model/wallpapers_model.dart';

class DetailProvider with ChangeNotifier
{
  Future<WallpaperModel?>? wallpaperModel;
  String search = "nature";
  int page=1;
  void wallpaper() {
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