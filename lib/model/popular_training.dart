import 'dart:convert';
import 'package:flutter_application/model/tag.dart';
import 'package:hive/hive.dart';

List<PopularTraining> popularTrainingListFromJson(String val) =>
    List<PopularTraining>.from(json
        .decode(val)['data']
        .map((jsonData) => PopularTraining.fromJson(jsonData)));

@HiveType(typeId: 3)
class PopularTraining {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final List<Tag> tags;

  PopularTraining(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.tags});

  factory PopularTraining.fromJson(Map<String, dynamic> data) =>
      PopularTraining(
          id: data['id'],
          name: data['attributes']['training']['data']['attributes']['name'],
          description: data['attributes']['training']['data']['attributes']
              ['description'],
          images: List<String>.from(data['attributes']['training']['data']
                  ['attributes']['images']['data']
              .map((image) => image['attributes']['url'])),
          tags: List<Tag>.from(data['attributes']['training']['data']
                  ['attributes']['tags']['data']
              .map((val) => Tag.fromJson(val))));
}
