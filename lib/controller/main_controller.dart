import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techinical/api/Methode.dart';
import 'package:techinical/model/news_model.dart';
import 'package:techinical/pages/detail_news_page.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var filterDate = false.obs;
  var filterStatus = false.obs;
  var filterType = false.obs;
  var applyFilterStatus = "";
  var applyFilterType = "";
  var selectedStatus = "";
  var selectedType = "";
  String country = "id";
  var page = 1.obs;
  var currentPage = 1.obs;
  int currentList = 10;
  String category = "";
  List<String> listCategory = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
  Article? dataArticle;
  NewsApi dataAPI = NewsApi.dataError();
  ScrollController scrollControllerList =
      ScrollController(initialScrollOffset: 1);
  resetAllFilter() async {
    filterDate.value = false;
    filterStatus.value = false;
    filterType.value = false;
    selectedStatus = "";
    selectedType = "";
    applyFilterStatus = "";
    applyFilterType = "";
    update();
    await getDataAPI("id", "");
  }

  onBuildPage() async {
    await getDataAPI("id", "");
    scrollInfinite();
  }

  detailArticle(Article data) {
    dataArticle = data;
    update();
    Get.to(const DetailNewsPage());
  }

  scrollInfinite() {
    scrollControllerList.addListener(() async {
      if (scrollControllerList.position.maxScrollExtent ==
          scrollControllerList.offset) {
        currentPage.value += 1;
        update();
        await scrollGetAPI();
      }
    });
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }

  getDataAPI(String dataCountry, String dataCategory) async {
    changeLoading();
    country = dataCountry;
    category = dataCategory;
    update();
    dataAPI = await getListNews(country, category, page.value.toString());
    update();
    changeLoading();
    inspect(dataAPI);
  }

  scrollGetAPI() async {
    if ((currentPage.value * 10) < dataAPI.totalResults) {
      var data =
          await getListNews(country, category, currentPage.value.toString());
      if (data.totalResults > 0) {
        for (var i in data.articles!) {
          dataAPI.articles!.add(i);
        }
      }
    }

    update();
  }
}
