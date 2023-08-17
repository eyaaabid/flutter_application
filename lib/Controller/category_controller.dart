import 'package:flutter_application/model/category.dart';
import 'package:flutter_application/service/local_service/local_category_service.dart';
import 'package:flutter_application/service/remote_service/remote_category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    await _localCategoryService.init();
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);
      if (_localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getCategories());
      }
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(CategoryfromJson(result.body));
        _localCategoryService.assignAllCategories(
            categories: CategoryfromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
