import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/const.dart';
import 'package:flutter_application/model/training.dart';
import 'package:shimmer/shimmer.dart';

import '../../training_details/training_details_screen.dart';

class TrainingCard extends StatelessWidget {
  final Training training;
  const TrainingCard({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TrainingDetailsScreen(training: training)));
      },
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: Hero(
                  tag: training.images.first,
                  child: CachedNetworkImage(
                    imageUrl: baseUrl + training.images.first,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    training.name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    training.tags.isNotEmpty
                        ? '\$${training.tags.first.rate.toStringAsFixed(2)}'
                        : '',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
