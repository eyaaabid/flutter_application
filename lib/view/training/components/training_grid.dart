import 'package:flutter/material.dart';
import 'package:flutter_application/view/training/components/training_card.dart';

import '../../../model/training.dart';

class TrainingGrid extends StatelessWidget {
  final List<Training> trainings;
  const TrainingGrid({Key? key , required this.trainings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: trainings.length,
        itemBuilder: (context, index) =>  TrainingCard(training: trainings[index]));
  }
}
