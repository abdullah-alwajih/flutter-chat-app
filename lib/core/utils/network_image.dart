import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../providers/app_urls.dart';
import '../styles/app_assets.dart';

Widget networkImage(String? imageUrl,
        {boxFit = BoxFit.fill, double? width, double? height}) =>
    CachedNetworkImage(
      fit: boxFit,
      width: width,
      height: height,
      imageUrl: (imageUrl ?? AppAssets.networkImage).contains(AppUrls.baseUrl)
          ? imageUrl!
          : '${AppUrls.baseUrl}$imageUrl',
      placeholder: (context, url) => SizedBox(
          width: width,
          height: height,
          child: Image.asset(AppAssets.loadingImage,
              fit: boxFit, width: width, height: height)
          // Shimmer.fromColors(
          //       baseColor: Colors.grey.shade50,
          //       highlightColor: Colors.grey.shade300,
          //       child:const Text(
          //       '',
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                   fontSize: 40.0,
          //                   fontWeight:
          //                   FontWeight.bold,
          //             ),
          //       ),
          // ),
          ),
      errorWidget: (context, url, error) => Image.asset(AppAssets.error,
          fit: boxFit, width: width, height: height),
    );
