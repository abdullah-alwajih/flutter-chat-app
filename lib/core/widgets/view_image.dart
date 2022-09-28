import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/network_image.dart';

class ViewImage extends GetView {
  final String id;
  final String? imageUrl;
  final Function? onClosed;

  const ViewImage(this.id, this.imageUrl, this.onClosed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).shadowColor,
          child: Stack(
            children: [
              Center(
                child: Hero(
                  tag: id,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: networkImage(imageUrl!),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary),
                  child: IconButton(
                    onPressed: onClosed as void Function()?,
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
