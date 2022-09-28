import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: ()=> Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios , color: context.theme.colorScheme.secondary,));
  }
}
