import 'package:flutter/material.dart';

class TerramFloatingButton extends StatelessWidget {
  final void Function()? onPressed;
  const TerramFloatingButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 2,
        right: 15,
        child: FloatingActionButton(
          onPressed: onPressed,
        ));
  }
}
