import 'package:flutter/material.dart';
import 'package:wallpapers_app/screen/home/model/wallpapers_model.dart';
import 'package:wallpapers_app/utils/wallpapers_helper.dart';
class HomeProvider with ChangeNotifier
{
  List<HitsModel>imageList=[];
  Future<void> getWallpaperAPI()
  async {
    WallpaperHelper helper=WallpaperHelper();
    WallpaperModel? model =await helper.WallpaperAPI();
    if(model!=null)
      {
         imageList=model.hitsList!;
         notifyListeners();

      }
  }
}