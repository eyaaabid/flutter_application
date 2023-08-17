import 'package:flutter/material.dart';
import 'package:flutter_application/model/popular_training.dart';
import 'package:flutter_application/view/home/components/popular_training/popular_training_card.dart';

class PopularTrainingComponent extends StatelessWidget {
  final List<PopularTraining> popularTrainings;
  const PopularTrainingComponent({Key? key, required this.popularTrainings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: popularTrainings.length,
          itemBuilder: (context, index) =>
              PopularTrainingCard(training: popularTrainings[index])),
    );
  }
}
