import 'dart:convert';
import 'package:flutter_application/model/tag.dart';
import 'package:hive/hive.dart';

part 'training.g.dart';

List<Training> trainingListFromJson(String val) => List<Training>.from(
    json.decode(val)['data'].map((jsonData) => Training.fromJson(jsonData)));

/*List<Training> TrainingListFromJson(String val) => List<Training>.from(json
    .decode(val)['data']
    .map((data) => Training.fromJson(data))); */

@HiveType(typeId: 3)
class Training {
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
  @HiveField(5)

  Training(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.tags
      });

  /*factory Training.fromJson(Map<String, dynamic> data) =>
      Training(
          id: data['id'],
          name: data['attributes']['training']['data']['attributes']['name'],
          description: data['attributes']['training']['data']['attributes']
              ['description'],
          images: List<String>.from(data['attributes']['training']['data']
                  ['attributes']['images']['data']
              .map((image) => image['attributes']['url'])),
          tags: []); */
  factory Training.fromJson(Map<String, dynamic> data) => Training(
      id: data['id'],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      images: List<String>.from(data['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: List<Tag>.from(
          data['attributes']['tags']['data'].map((val) => Tag.fromJson(val))));
}
