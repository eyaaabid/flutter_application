import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_application/Controller/controllers.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 10)
      ]),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  child: Obx(
            () => TextField(
              autofocus: false,
              controller: trainingController.searchTextEditController,
              onSubmitted: (val) {
                trainingController.getTrainingByName(keyword: val);
                dashboardController.updateIndex(1);
              },
              onChanged: (val) {
                trainingController.searchVal.value = val;
              },
              decoration: InputDecoration(
                suffixIcon: trainingController.searchVal.value.isNotEmpty? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    trainingController.searchTextEditController.clear();
                    trainingController.searchVal.value ='';
                    trainingController.getTrainings();
                }, ):null,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none),
                hintText: "search...",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ))),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 8)
                ]),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Badge(
            badgeContent: const Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6), blurRadius: 8)
                  ]),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.record_voice_over_outlined,
                  color: Colors.grey),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
