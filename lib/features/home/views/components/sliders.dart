import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/styles/app_themes.dart';

// sliders() {
//   HomeController controller = Get.find<HomeController>();
//   return Stack(
//     children: [
//       Container(
//         height: 236,
//         decoration: BoxDecoration(
//             color: Theme.of(Get.context!).primaryColorLight,
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(100.0),
//               bottomRight: Radius.circular(100.0),
//             )),
//       ),
//       SizedBox(
//         height: 285,
//         child: CarouselSlider(
//           options: CarouselOptions(
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 5),
//             height: 250,
//             viewportFraction: 0.8,
//             enlargeCenterPage: true,
//             enlargeStrategy: CenterPageEnlargeStrategy.height,
//             // onPageChanged: (index, reason) {},
//           ),
//           items: controller.sliders.isEmpty
//               ? [buildStack()]
//               : controller.sliders
//                   .map((slide) =>
//                       InkWell(onTap: () {}, child: buildStack(slide)))
//                   .toList(),
//         ),
//       ),
//     ],
//   );
// }

Stack buildStack([dynamic slide]) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 40),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 270,
        width: double.infinity,
        decoration: AppThemes.boxDecoration(
          color: Theme.of(Get.context!).cardColor,
          radius: 15,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: slide == null
              ? Image.asset('assets/img/loading.gif', fit: BoxFit.cover)
              : Image.asset(slide.images[0],
                  height: 250, width: double.infinity),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(12),
          height: 80,
          decoration: AppThemes.boxDecoration(
            color: Theme.of(Get.context!).cardColor,
            radius: 15.0,
          ),
          child: Column(
            children: [
              Text(slide?.title, style: Get.theme.textTheme.headline6),
              Expanded(
                  child: Center(child: Text(slide?.shortDescription ?? ""))),
            ],
          ),
        ),
      )
    ],
  );
}
