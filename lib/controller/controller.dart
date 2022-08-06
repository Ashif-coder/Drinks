import 'dart:collection';
import 'dart:io';

import 'package:drinks/model/Drinks_item_model.dart';
import 'package:flutter/material.dart';
import 'package:drinks/model/data_model.dart';
import 'package:drinks/service/service.dart';


enum Stage { ERROR, NETWORKERROR, LOADING, DONE}
class MyProvider extends ChangeNotifier {
  Stage stage = Stage.LOADING;
  List<DrinksItemModel> drinks = [];
  bool showSpinner = false;
  String _searchString = "";

  void showSpinningStat(bool status) {
    showSpinner = status;
    notifyListeners();
  }

//searching list
  UnmodifiableListView get drink => _searchString.isEmpty
      ? UnmodifiableListView(drinks)
      : UnmodifiableListView(drinks.where((drinksItemModel) =>
      drinksItemModel.strDrink.toLowerCase().contains(_searchString.toLowerCase())));

  void changeSearchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }


  //fetching data

  void setFetchDrink(DrinksModel apiResponse) async {

    drinks = apiResponse.drinks;
    notifyListeners();
  }

  Future<Stage> fetchDrink() async {
    stage = Stage.LOADING;
    dynamic data;
    notifyListeners();
    try {
      data = await ServiceApi().getNews();
      setFetchDrink(data);
      stage = Stage.DONE;
    } on SocketException {
      stage = Stage.NETWORKERROR;
    } catch (e) {
      stage =  Stage.ERROR;
    }
    notifyListeners();
    return stage;
  }

}