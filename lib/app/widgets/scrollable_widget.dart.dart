import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  ScrollableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final _scrollControllerHorizontal = ScrollController();
  final _scrollControllerVertical = ScrollController();

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          scrollbars: true,
          overscroll: true,
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        child: SingleChildScrollView(
          controller: _scrollControllerHorizontal,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: SingleChildScrollView(
            controller: _scrollControllerVertical,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: child,
          ),
        ),
      );
}
