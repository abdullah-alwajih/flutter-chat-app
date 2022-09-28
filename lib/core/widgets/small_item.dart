import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_assets.dart';
import '../styles/app_themes.dart';
import '../utils/network_image.dart';

smallCard(String? image, String? name, onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 75,
          height: 75,
          decoration: AppThemes.boxDecoration(radius: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image == null
                  ? Image.asset(AppAssets.loadingImage, fit: BoxFit.cover)
                  : networkImage(image)),
        ),
        const SizedBox(height: 5),
        SizedBox(
            width: 100,
            height: 50,
            child: Center(child: Text(name ?? '',textAlign: TextAlign.center,maxLines: 2, style: Get.textTheme.bodyText2!.copyWith(height: 1.2),))),
      ],
    ),
  );
}



customSmallCard(String? image, String? name, onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.all(10),
          decoration: AppThemes.boxDecoration(radius: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image == null
                  ? Image.asset(AppAssets.loadingImage, fit: BoxFit.cover)
                  : networkImage(image)),
        ),
        const SizedBox(height: 5),
        SizedBox(
            width: 70,
            height: 35,
            child: Center(child: Text(name ?? '',textAlign: TextAlign.center,maxLines: 2, style: Get.textTheme.caption!.copyWith(color: Colors.black,height: 1.2, fontWeight: FontWeight.bold),))),
      ],
    ),
  );
}

smallCardWithStar(String? image, String? name,rating, onTap ,BuildContext context , {String? star}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 90,
          height: 100,
          decoration: AppThemes.boxDecoration(radius: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image == null
                  ? Image.asset(AppAssets.loadingImage, fit: BoxFit.cover)
                  : networkImage(image)),
        ),
        const SizedBox(height: 5),
        SizedBox(
            width: 80,
            height: 20,
            child: Center(child: Text(name ?? '',textAlign: TextAlign.center,maxLines: 1, style: Get.textTheme.bodyText2!.copyWith(height: 1.2, fontWeight: FontWeight.bold),))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star , size: 14,color: context.theme.colorScheme.secondary,),
            const SizedBox(width: 5,),
             Text(double.tryParse(rating ?? '0').toString()  ,style: Get.textTheme.caption)
        ],),
      ],
    ),
  );
}

smallGridViewCard(String? image, String? name, onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 65,
          height: 65,
          decoration: AppThemes.boxDecoration(radius: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image == null
                  ? Image.asset(AppAssets.loadingImage, fit: BoxFit.cover)
                  : networkImage(image)),
        ),
        const SizedBox(height: 5),
        SizedBox(
            width: 80,
            height: 40,
            child: Center(child: Text(name ?? '',textAlign: TextAlign.center,maxLines: 2, style: Get.textTheme.bodyText2!.copyWith(height: 1.2),))),
      ],
    ),
  );
}
