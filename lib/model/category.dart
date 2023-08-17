import 'dart:convert';
import 'package:hive/hive.dart';

part 'category.g.dart';

List<Category> popularCategoryListFromJson(String val) => List<Category>.from(
    json.decode(val)['data'].map((category) => Category.fromJson(category)));

List<Category> CategoryfromJson(String val) => List<Category>.from(json
    .decode(val)['data']
    .map((category) => Category.CategoryfromJson(category)));

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> data) => Category(
      id: data['id'],
      name: data['attributes']['category']['data']['attributes']['name'],
      image: data['attributes']['category']['data']['attributes']['image']
          ['data']['attributes']['url']);

  factory Category.CategoryfromJson(Map<String, dynamic> data) => Category(
      id: data['id'],
      name: data['attributes']['name'],
      image: data['attributes']['image']['data']['attributes']['url']);
}
