import 'package:flutter/cupertino.dart';

import '../../../utils/wallpapers_helper.dart';
import '../../home/model/wallpapers_model.dart';

class CategorisProvider with ChangeNotifier
{
  bool isGrid=true;
  Future<WallpaperModel?>? wallpaperModel;
  String search = "nature";
  int page=1;
  void changeVie()
  {
    isGrid=isGrid;
    notifyListeners();
  }

  void getWallpaper() {
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