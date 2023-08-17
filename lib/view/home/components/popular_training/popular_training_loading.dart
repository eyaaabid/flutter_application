import 'package:flutter/material.dart';
import 'package:flutter_application/view/home/components/popular_training/popular_training_loading_card.dart';


class PopularTrainingLoading extends StatelessWidget {
  const PopularTrainingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const PopularTrainingLoadingCard()),
    );
  }
}