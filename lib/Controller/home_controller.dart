import 'package:flutter_application/model/popular_training.dart';
import 'package:flutter_application/service/local_service/local_ad_banner_service.dart';
import 'package:get/get.dart';
import 'package:flutter_application/service/remote_service/remote_banner_service.dart';
import 'package:flutter_application/service/remote_service/remote_popular_category_service.dart';
import '../model/ad_banner.dart';
import '../model/category.dart';
import '../model/training.dart';
import '../service/local_service/local_category_service.dart';
import '../service/local_service/local_training_service.dart';
import '../service/remote_service/remote_popular_training_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<PopularTraining> popularTrainingList =
      List<PopularTraining>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularTrainingLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalTrainingService _localTrainingService = LocalTrainingService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localTrainingService.init();
    getAdBanners();
    getPopularCategories();
    getPopularTrainings();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad_banners before call api
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save api result to local db
        _localAdBannerService.assignAllBanners(
            adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      if (bannerList.isNotEmpty) {
        print(bannerList.first.image);
      }
      isBannerLoading.value = false;
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      if (_localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList
            .assignAll(_localCategoryService.getPopularCategories());
      }
      var result = await RemotePopularCategoryService().get();

      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        _localCategoryService.assignAllPopularCategories(
            popularCategories: popularCategoryListFromJson(result.body));
      }
    } finally {
      if (popularCategoryList.isNotEmpty) {
        print(popularCategoryList.first.image);
      }
      isPopularCategoryLoading(false);
    }
  }

  void getPopularTrainings() async {
    try {
      isPopularTrainingLoading(true);
      if (_localTrainingService.getTrainings().isNotEmpty) {
        //popularTrainingList.assignAll(_localTrainingService.getTrainings());
      }
      var result = await RemotePopularTraining().get();
      if (result != null) {
        popularTrainingList.assignAll(popularTrainingListFromJson(result.body));
        // _localTrainingService.assignTrainings(
        //     trainings: popularTrainingListFromJson(
        //         result.body));
      }
    } finally {
      isPopularTrainingLoading(false);
    }
  }
}
