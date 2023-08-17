import 'package:flutter/material.dart';
import 'package:flutter_application/Controller/controllers.dart';
import 'package:flutter_application/view/category/components/category_card.dart';
import 'package:get/get.dart';

class Categorycreen extends StatelessWidget {
  const Categorycreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.categoryList.isNotEmpty) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: categoryController.categoryList.length,
          itemBuilder: (context, index) =>
              CategoryCard(category: categoryController.categoryList[index]),
        );
      } else {
        return Container();
      }
    });
  }
}
