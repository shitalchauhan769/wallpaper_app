import 'package:flutter/material.dart';
import 'package:wallpapers_app/screen/home/model/wallpapers_model.dart';
import 'package:wallpapers_app/utils/wallpapers_helper.dart';

import '../../../utils/shared_helper.dart';
import '../../categories/model/categoris_model.dart';

class HomeProvider with ChangeNotifier {
  Future<WallpaperModel?>? wallpaperModel;
  int isIndex = 0;
  String search = "nature";
  List<HitsModel>hintList=[];
  int page =1;
  String themeName = "system";
  String? theme;
  bool? isTheme=false;
  List<CategorisModel>categoris=[
    CategorisModel(name: "Abstract",image: "https://img.freepik.com/free-photo/abstract-backdrop-illustration-with-multi-colored-design-shapes-generated-by-ai_188544-15582.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1721260800&semt=ais_user"),
    CategorisModel(name: "Cyberpunk",image: "https://static.vecteezy.com/system/resources/previews/026/727/261/large_2x/night-landscape-view-cyberpunk-city-illustration-free-photo.jpg"),
    CategorisModel(name: "Flower",image: "https://t4.ftcdn.net/jpg/05/57/29/25/360_F_557292539_2kXYz0frOcCGISoYEd2MNTmxyT0lYyOj.jpg"),
    CategorisModel(name: "Gem",image: "https://img.freepik.com/premium-photo/diamond-jewelry-crystal-gem-jewel-stone-brilliant-luxury-isolated-white-gemstone-preciou_851808-488.jpg"),
    CategorisModel(name: "Love",image: "https://t4.ftcdn.net/jpg/05/79/97/63/360_F_579976316_DbyXgpWRW1iqYOIJsXSXkJnQjVXHVUPu.jpg"),
    CategorisModel(name: "Sky",image: "https://wallpapers.com/images/featured/sky-mvehfqz6w2ges2dj.jpg"),
    CategorisModel(name: "Animals",image: "https://media.wired.com/photos/59822d6fbc944559d607e43a/master/pass/PeacockHP-691483428.jpg"),
    CategorisModel(name: "Anime",image: "https://i.pinimg.com/736x/bd/6b/12/bd6b129521e00bc5f3ff787364286e6c.jpg"),
    CategorisModel(name: "Fruit",image: "https://media.istockphoto.com/id/529664572/photo/fruit-background.jpg?s=612x612&w=0&k=20&c=K7V0rVCGj8tvluXDqxJgu0AdMKF8axP0A15P-8Ksh3I="),
    CategorisModel(name: "Geometry",image: "https://www.thoughtco.com/thmb/CxIHfXlNGJudzL69XMa5rxQePA4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/large-group-of-various-multi-colored-geometric-shapes-530022001-5a9ec575119fa80037446909.jpg"),
    CategorisModel(name: "Neon",image: "https://media.istockphoto.com/id/1276580714/photo/3d-render-abstract-minimal-background-pink-blue-neon-light-square-frame-with-copy-space.webp?b=1&s=612x612&w=0&k=20&c=iY7i4jgqLETR592RWMFSbRpXrcKOogyQvghEHI_KuBk="),
    CategorisModel(name: "Live Wallp..",image: "https://i.pinimg.com/736x/3c/62/6b/3c626b8d4a58a3688e48eccb5ba8c96f.jpg"),
    CategorisModel(name: "Star",image: "https://img.freepik.com/premium-photo/beautiful-picture-star-amazing-star-images-download_555090-19944.jpg"),
    CategorisModel(name: "Dark",image: "https://science.nasa.gov/wp-content/uploads/2023/06/coma-cluster-jpg.webp?w=1280"),
    CategorisModel(name: "Desert",image: "https://cdnph.upi.com/sv/ph/og/i/1221480539480/2016/1/14805416892476/v1.5/How-did-the-Sahara-Desert-get-so-dry.jpg"),
    CategorisModel(name: "Funny",image: "https://thumbs.dreamstime.com/b/sleeping-red-panda-funny-cute-animal-image-ailurus-fulgens-asleep-afternoon-siesta-90417307.jpg"),
    CategorisModel(name: "Sea",image: "https://t3.ftcdn.net/jpg/05/63/76/92/360_F_563769202_XvjMvyMO593Wt70Um2OQPJ5CZrTXbT4t.jpg"),
    CategorisModel(name: "Landscape",image: "https://img.freepik.com/premium-photo/free-best-noon-nature-pictures-images-imagine-view_951992-2098.jpg"),
    CategorisModel(name: "Happy",image: "https://st.depositphotos.com/4058993/60405/i/450/depositphotos_604056392-stock-photo-happy-faces-ball-yellow-background.jpg"),
    CategorisModel(name: "Good Morning",image: "https://cdnjs.angroos.com/wp-content/uploads/2023/12/DALL%C2%B7E-2024-03-04-17.09.37-A-realistic-image-of-a-bright-and-cheerful-flower-greeting-the-morning.-The-flower-perhaps-a-vibrant-sunflower-or-a-delicate-rose-is-in-full-bloom-.jpg"),
    CategorisModel(name: "Sed",image: "https://cdn.dribbble.com/users/1588659/screenshots/10864996/media/8dcbc47174f809dbb3f305728db24228.gif"),
    CategorisModel(name: "Motivation",image: "https://www.univariety.com/blog/wp-content/uploads/2014/08/motivational-goals-1200x1200.jpg"),
    CategorisModel(name: "Success",image: "https://wallpapers.com/images/featured/success-pictures-dc8ptcpsu9t97ljq.jpg"),
    // CategorisModel(name: "",image: ""),
  ];


  void changeImage(int index) {
    isIndex = index;
    notifyListeners();
  }

  void getWallpaperAPI() {
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


  void setTheme(String theme) {
    SharedHelper shr = SharedHelper();
    shr.setTheme(theme );
    getTheme();
  }
  Future<void> getTheme() async {
    SharedHelper shr = SharedHelper();
    theme=await shr.getTheme();
    notifyListeners();
  }


  void checkTheme()
  {
    isTheme!=isTheme;
    notifyListeners();
  }


}
