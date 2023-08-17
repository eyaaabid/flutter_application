import 'package:flutter_application/model/category.dart';
import 'package:hive/hive.dart';

class LocalCategoryService {
  late Box<Category> _popularCategoryBox;
  late Box<Category> _CategoryBox;

  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategories');
    _CategoryBox = await Hive.openBox<Category>('Categories');
  }

  Future<void> assignAllPopularCategories(
      {required List<Category> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  Future<void> assignAllCategories({required List<Category> categories}) async {
    await _CategoryBox.clear();
    await _CategoryBox.addAll(categories);
  }

  List<Category> getPopularCategories() => _popularCategoryBox.values.toList();
  List<Category> getCategories() => _CategoryBox.values.toList();
}
