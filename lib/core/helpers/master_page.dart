import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  final Widget buildMobileLayout;
  final Widget buildTabletLayout;

  const MasterPage({
    required this.buildMobileLayout,
    required this.buildTabletLayout,
    Key? key,
  }) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  static const int kTabletBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    return shortestSide < kTabletBreakpoint
        ? widget.buildMobileLayout
        : widget.buildTabletLayout;
  }
}
