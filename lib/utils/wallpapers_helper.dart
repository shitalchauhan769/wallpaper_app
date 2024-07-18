import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:wallpapers_app/screen/home/model/wallpapers_model.dart';
class WallpaperHelper
{
  Future<WallpaperModel ?> WallpaperAPI(String search,int page)
  async {
    String link ="https://pixabay.com/api/?key=44956206-691dc0b23404010588a9d84c3&q=$search&orientation.vertical&page=$page";

    var response=await http.get(Uri.parse(link));

    if(response.statusCode==200)
      {
        var json=jsonDecode(response.body);
        WallpaperModel model =WallpaperModel.mapTOModel(json);

        return model;
      }
    return null;
  }
}