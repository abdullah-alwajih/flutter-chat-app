import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double radius;
  final Widget? child;
  final bool primary;

  const GradientButton({
    required this.onPressed,
    this.child,
    this.radius = 10,
    this.primary = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: child == null ? (){} :onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: primary
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.secondaryContainer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primary
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).colorScheme.secondary,
              primary
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.secondaryContainer,
            ]),
            borderRadius: BorderRadius.circular(radius)),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          child: child ??  SpinKitThreeBounce(
            color: Get.theme.scaffoldBackgroundColor,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
