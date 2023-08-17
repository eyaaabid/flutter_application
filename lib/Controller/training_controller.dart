import 'package:flutter/material.dart';
import 'package:flutter_application/model/training.dart';
import 'package:flutter_application/service/remote_service/remote_training.dart';
import 'package:get/get.dart';

void getTrainingController() {
  Get.put(TrainingController());
}

class TrainingController extends GetxController {
  static TrainingController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  static RxList<Training> trainingList =
      List<Training>.empty(growable: true).obs;
  RxBool isTrainingLoading = false.obs;

  @override
  void onInit() {
    getTrainings();
    super.onInit();
  }

  void getTrainings() async {
    try {
      isTrainingLoading(true);
      var result = await RemoteTrainingService().get();
      if (result != null) {
        trainingList.assignAll(trainingListFromJson(result.body));
      }
    } finally {
      isTrainingLoading(false);
      print(trainingList.length);
    }
  }

  void getTrainingByName({required String keyword}) async {
    try {
      isTrainingLoading(true);
      var result = await RemoteTrainingService().getByName(keyword: keyword);
      if (result != null) {
        trainingList.assignAll(trainingListFromJson(result.body));
      }
    } finally {
      isTrainingLoading(false);
      print(trainingList.length);
    }
  }

  void getByCategory({required int id}) async {
    try {
      isTrainingLoading(true);
      var result = await RemoteTrainingService().getByCategory(id: id);
      if (result != null) {
        trainingList.assignAll(trainingListFromJson(result.body));
      }
    } finally {
      isTrainingLoading(false);
      print(trainingList.length);
    }
  }
}
