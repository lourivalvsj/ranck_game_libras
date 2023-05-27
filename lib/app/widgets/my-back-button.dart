import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class MyBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double? width;
  final bool widthInfinity;
  final EdgeInsetsGeometry? padding;
  const MyBackButton({
    Key? key,
    this.onPressed,
    this.child,
    this.width,
    this.widthInfinity = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthInfinity ? null : width ?? widthDefaultInput / 1.5,
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      child: ElevatedButton(
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.all(SobratColors.btnVoltar),
        ),
        onPressed: onPressed ?? () => Get.back(),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text('VOLTAR')
              ],
            ),
      ),
    );
  }
}
