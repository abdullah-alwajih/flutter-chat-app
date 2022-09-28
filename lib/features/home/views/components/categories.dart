import 'package:flutter/material.dart';

import '../../../../core/widgets/card_button.dart';

Widget categories(List<String> listItem) {
  return GridView.count(
    padding: const EdgeInsets.all(20.0),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 3,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    children: listItem
        .map((item) => CardButton(
            onPressed: () {},
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(item)),
                const Spacer(),
                const Text('تويوتا'),
              ],
            )))
        .toList(),
  );
}
