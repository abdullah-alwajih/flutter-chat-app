import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Icon? icon;
  final String? text;
  final bool hasNavigation;
  final VoidCallback? onPressed;

  const ListItem({
    Key? key,
    this.icon,
    this.text,
    this.onPressed,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  icon!,
                  const SizedBox(width: 12),
                  Text(text!, style: Theme.of(context).textTheme.subtitle2),
                  const Spacer(),
                  if (hasNavigation)
                    const Icon(Icons.arrow_forward_ios_outlined, size: 16),
                ],
              ),
            ),
          );
  }
}
