class WallpaperModel
{
  int? total,totalHits;
  List<HitsModel>?hitsList=[];


  WallpaperModel({this.total, this.totalHits, required this.hitsList});


  factory WallpaperModel.mapTOModel(Map m1)
  {
    List l1= m1['hits'];

    return WallpaperModel(total: m1['total'],totalHits: m1['totalHits'],hitsList:l1.map((e) => HitsModel.mapToModel(e)).toList());
  }
}
class HitsModel
{
  int? id;
  String? pageURL,previewURL;

  HitsModel({this.id, this.pageURL, this.previewURL});
  factory HitsModel.mapToModel(Map m1)
  {
    return HitsModel(id: m1['id'],pageURL: m1['pageURL'],previewURL: m1['previewURL']);
  }
}