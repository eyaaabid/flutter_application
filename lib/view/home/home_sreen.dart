import 'package:flutter/material.dart';
import 'package:flutter_application/Controller/controllers.dart';
import 'package:flutter_application/component/main_header.dart';
import 'package:flutter_application/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:flutter_application/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:flutter_application/view/home/components/popular_category/popular_category.dart';
import 'package:flutter_application/view/home/components/popular_category/popular_category_loading.dart';
import 'package:flutter_application/view/home/components/popular_training/popular_training.dart';
import 'package:flutter_application/view/home/components/popular_training/popular_training_loading.dart';
import 'package:flutter_application/view/home/components/section_title.dart';
import 'package:get/get.dart';
import 'package:flutter_application/Widgets/build_Categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        buildCategories(),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Obx(
              () {
                if (homeController.bannerList.isNotEmpty) {
                  return CarouselSliderView(
                      bannerList: homeController.bannerList);
                } else {
                  return const CarouselLoading();
                }
              },
            ),
            SectionTitle(title: "New Trainings"),
            Obx(
              () {
                if (homeController.popularCategoryList.isNotEmpty) {
                  return PopularCategory(
                      categories: homeController.popularCategoryList);
                } else {
                  return const PopularCategoryLoading();
                }
              },
            ),
            SectionTitle(title: "Popular Trainings"),
            Obx(
              () {
                if (homeController.popularTrainingList.isNotEmpty) {
                  return PopularTrainingComponent(
                      popularTrainings: homeController.popularTrainingList);
                } else {
                  return const PopularTrainingLoading();
                }
              },
            ),
          ]),
        )),
      ],
    ));
  }
}
