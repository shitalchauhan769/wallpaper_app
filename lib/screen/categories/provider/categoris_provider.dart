import 'package:flutter/cupertino.dart';

class CategorisProvider with ChangeNotifier
{
  bool isGrid=true;
  void changeVie()
  {
    isGrid=isGrid;
    notifyListeners();
  }
}