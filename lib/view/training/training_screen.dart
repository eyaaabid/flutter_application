import 'package:flutter/material.dart';
import 'package:flutter_application/Controller/controllers.dart';
import 'package:flutter_application/Controller/training_controller.dart';
import 'package:flutter_application/view/training/components/training_grid.dart';
import 'package:flutter_application/view/training/components/training_loading_grid.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../component/main_header.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(child: Obx(() {
          if (TrainingController.trainingList.isNotEmpty) {
            return TrainingGrid(trainings: TrainingController.trainingList);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/page_not_found.png'),
                SizedBox(
                  height: 10,
                ),
                const Text("Trainings Not Found!")
              ],
            );
          }
        }))
      ],
    ));
  }
}
