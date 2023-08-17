import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularTrainingLoadingCard extends StatelessWidget {
  const PopularTrainingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Container(
            margin: EdgeInsets.all(10),
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 80, // Reduced height
                  color: Colors.grey,
                ),
                const SizedBox(height: 5), // Reduced spacing
                Container(
                  height: 6, // Reduced height
                  width: 80,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
