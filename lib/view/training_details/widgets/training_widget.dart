import 'package:flutter/material.dart';
import 'package:flutter_application/view/training_details/widgets/save_icon.dart';

Widget getInfo() {
  return Container(
    child: Column(
      children: [
        Row(
          children: [Text("Course 1"), SaveIcon()],

        )
      ],
    ),
  );
}
