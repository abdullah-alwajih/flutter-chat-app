import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../../core/widgets/card_button.dart';
import '../../controllers/user_controller.dart';

UserController _controller = Get.find();

Widget buildImageProfile(BuildContext context) {
  return Center(
    child: Stack(
      children: [
        // Obx(
        //   () => Container(
        //     decoration: BoxDecoration(
        //         color: Get.theme.cardColor,
        //         boxShadow: AppThemes.boxShadow,
        //         borderRadius: BorderRadius.circular(100.0)),
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(100.0),
        //       child: _controller.imageFile.value != null
        //           ? Image.file(_controller.imageFile.value!,
        //               height: 150, width: 150)
        //           : networkImage(
        //               _controller.userServices.currentUser.value!.image!,
        //               width: 150,
        //               height: 150),
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => showModalBottomSheet(
                context: context, builder: (context) => bottomSheet(context)),
          ),
        ),
      ],
    ),
  );
}

Widget bottomSheet(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          SuperTranslations.of.authChooseProfilePhoto,
          style: context.textTheme.subtitle1,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CardButton(
                  onPressed: () => _controller.takePhoto(ImageSource.camera),
                  radius: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera),
                      const SizedBox(width: 8),
                      Text(
                        SuperTranslations.of.commonCamera,
                        style: context.textTheme.button,
                      ),
                    ],
                  )),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: CardButton(
                    onPressed: () => _controller.takePhoto(ImageSource.gallery),
                    radius: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.satellite_outlined),
                        const SizedBox(width: 8),
                        Text(
                          SuperTranslations.of.commonGallery,
                          style: context.textTheme.button,
                        ),
                      ],
                    )))
          ],
        )
      ],
    ),
  );
}
